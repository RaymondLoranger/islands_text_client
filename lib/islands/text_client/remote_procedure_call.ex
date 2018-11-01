defmodule Islands.TextClient.RemoteProcedureCall do
  use PersistConfig

  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Tally
  alias Islands.Engine

  alias Islands.TextClient.Summary.Message.{
    GameAlreadyStarted,
    GameAlreadyUnderway,
    GameNotStarted
  }

  @node Application.get_env(@app, :islands_node)

  @spec new_game(String.t(), String.t()) :: String.t() | no_return
  def new_game(game_name, player_name) do
    Node.connect(@node)
    :ok = :global.sync()
    me = self()

    case :rpc.call(@node, Engine, :new_game, [game_name, player_name, me]) do
      {:ok, _pid} ->
        game_name

      {:error, {:already_started, _pid}} ->
        game_name
        |> GameAlreadyStarted.message()
        |> ANSI.format()
        |> IO.puts()

        self() |> Process.exit(:normal)

      error ->
        exit(error)
    end
  end

  @spec add_player(String.t(), String.t()) :: String.t() | no_return
  def add_player(game_name, player_name) do
    Node.connect(@node)
    :ok = :global.sync()
    me = self()

    case :rpc.call(@node, Engine, :add_player, [game_name, player_name, me]) do
      %Tally{response: {:ok, :player2_added}} ->
        game_name

      %Tally{response: {:error, :player2_already_added}} ->
        game_name
        |> GameAlreadyUnderway.message()
        |> ANSI.format()
        |> IO.puts()

        self() |> Process.exit(:normal)

      {:badrpc, {:EXIT, {:noproc, _}}} ->
        game_name
        |> GameNotStarted.message()
        |> ANSI.format()
        |> IO.puts()

        self() |> Process.exit(:normal)

      error ->
        IO.inspect(error, label: "*** error ***")
        exit(error)
    end
  end
end

defmodule Islands.Text.Client.RemoteProcedureCall do
  use PersistConfig

  alias __MODULE__.{
    GameAlreadyStarted,
    GameAlreadyUnderway,
    GameNotStarted,
    IslandsEngineNotStarted
  }

  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Tally
  alias Islands.Engine

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
        game_name |> GameAlreadyStarted.message() |> ANSI.puts()
        self() |> Process.exit(:normal)

      {:badrpc, :nodedown} ->
        IslandsEngineNotStarted.message() |> ANSI.puts()
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
        game_name |> GameAlreadyUnderway.message() |> ANSI.puts()
        self() |> Process.exit(:normal)

      {:badrpc, {:EXIT, {:noproc, _}}} ->
        game_name |> GameNotStarted.message() |> ANSI.puts()
        self() |> Process.exit(:normal)

      {:badrpc, :nodedown} ->
        IslandsEngineNotStarted.message() |> ANSI.puts()
        self() |> Process.exit(:normal)

      error ->
        exit(error)
    end
  end
end
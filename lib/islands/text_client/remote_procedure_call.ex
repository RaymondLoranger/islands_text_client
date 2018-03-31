defmodule Islands.TextClient.RemoteProcedureCall do
  @moduledoc false

  use PersistConfig

  alias Islands.{Engine, Engine.Tally}

  @node Application.get_env(@app, :islands_node)

  @spec new_game(String.t()) :: String.t() | no_return
  def new_game(game_name) do
    Node.connect(@node)
    :ok = :global.sync()
    me = self()

    case :rpc.call(@node, Engine, :new_game, [game_name, me]) do
      {:ok, _pid} -> game_name
      error -> exit(error)
    end
  end

  @spec add_player(String.t(), String.t()) :: String.t() | no_return
  def add_player(game_name, player_name) do
    Node.connect(@node)
    :ok = :global.sync()
    me = self()

    case :rpc.call(@node, Engine, :add_player, [game_name, player_name, me]) do
      %Tally{response: {:ok, :player2_added}} -> game_name
      error -> exit(error)
    end
  end
end

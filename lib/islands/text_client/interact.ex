defmodule Islands.TextClient.Interact do
  @moduledoc """
  Interacts with a client playing the Islands game.
  """
  # @moduledoc false

  alias Islands.TextClient.{Player, RemoteProcedureCall, State}

  @doc """
  Lets player1 start a game.

  App `islands_engine` must run in node with short name `islands`...
  - `cd islands_engine`
  - `iex --sname islands -S mix`
  - `:observer.start() # optional`

  Player1 runs in a node with any short name (here `client1`)...
  - `cd islands_text_client`
  - `iex --sname client1 -S mix`

  Player1 (`Adam`) starts a game (`Eden`) from his node like so:
  - `Islands.TextClient.start("Eden", "Adam")`
  """
  @spec start(String.t(), String.t()) :: no_return
  def start(game_name, player_name)
      when is_binary(game_name) and is_binary(player_name) do
    game_name
    |> RemoteProcedureCall.new_game(player_name)
    |> State.init(:player1, player_name)
    |> Player.play()
  end

  @doc """
  Lets player2 join a game.

  Player2 runs in a node with any short name (here `client2`)...
  - `cd islands_text_client`
  - `iex --sname client2 -S mix`

  Player2 (`Eve`) joins game `Eden` from her node like so:
  - `Islands.TextClient.join("Eden", "Eve")`
  """
  @spec join(String.t(), String.t()) :: no_return
  def join(game_name, player_name)
      when is_binary(game_name) and is_binary(player_name) do
    game_name
    |> RemoteProcedureCall.add_player(player_name)
    |> State.init(:player2, player_name)
    |> Player.play()
  end
end

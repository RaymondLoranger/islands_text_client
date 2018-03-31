defmodule Islands.TextClient.Interact do
  # @moduledoc """
  # Interacts with a client playing an Islands game.
  # """
  @moduledoc false

  alias Islands.TextClient.{Player, RemoteProcedureCall, State}

  @spec start(String.t()) :: no_return
  def start(game_name) when is_binary(game_name) do
    game_name
    |> RemoteProcedureCall.new_game()
    |> State.init(:player1)
    |> Player.play()
  end

  @spec join(String.t(), String.t()) :: no_return
  def join(game_name, player_name) do
    game_name
    |> RemoteProcedureCall.add_player(player_name)
    |> State.init(:player2, player_name)
    |> Player.play()
  end
end

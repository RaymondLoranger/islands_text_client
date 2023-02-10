defmodule Islands.Text.Client.Joiner do
  @moduledoc """
  Lets player2 join a game.
  """

  import Islands.Text.Client.Guard, only: [valid?: 4]

  alias Islands.Client.{Player, RPC, State}
  alias Islands.Game
  alias Islands.Player, as: Gamer
  alias Islands.Text.Client

  @doc """
  Lets player2 join a game on a remote node.
  """
  @spec join(Game.name(), Gamer.name(), Gamer.gender(), Keyword.t()) ::
          no_return
  def join(game_name, player_name, gender, options \\ [])
      when valid?(game_name, player_name, gender, options) do
    RPC.add_player(Client.engine_node(), game_name, player_name, gender)
    |> State.new(:player2, player_name, gender, options)
    |> Player.play()
  end
end

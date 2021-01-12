defmodule Islands.Text.Client.Starter do
  @moduledoc """
  Allows to start the _Game of Islands_.
  """

  import Islands.Text.Client.Guard

  alias Islands.Client.{Player, RPC, State}
  alias Islands.Game
  alias Islands.Player, as: Gamer
  alias Islands.Text.Client

  @spec start(Game.name(), Gamer.name(), Gamer.gender(), Keyword.t()) ::
          no_return
  def start(game_name, player_name, gender, options \\ [])
      when valid?(game_name, player_name, gender, options) do
    RPC.new_game(Client.engine_node(), game_name, player_name, gender)
    |> State.new(:player1, player_name, gender, options)
    |> Player.play()
  end
end

defmodule Islands.TextClient.Player.React.Initialized do
  @moduledoc false

  alias Islands.TextClient.Player.React.Wait
  alias Islands.TextClient.State

  @spec wait(State.t()) :: State.t()
  def wait(%State{player_id: :player1} = state) do
    Wait.for(state, :players_set, "an opponent to join the game")
  end
end

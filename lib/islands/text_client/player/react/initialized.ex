defmodule Islands.TextClient.Player.React.Initialized do
  alias Islands.TextClient.Player.Wait
  alias Islands.TextClient.State

  @spec wait(State.t()) :: State.t()
  def wait(%State{player_id: :player1} = state),
    do: Wait.wait_for(state, :players_set, "an opponent to join the game")
end

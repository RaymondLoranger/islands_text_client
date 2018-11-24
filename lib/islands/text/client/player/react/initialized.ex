defmodule Islands.Text.Client.Player.React.Initialized do
  alias Islands.Text.Client.Player.Wait
  alias Islands.Text.Client.State

  @spec wait(State.t()) :: State.t()
  def wait(%State{player_id: :player1} = state),
    do: Wait.wait_for(state, :players_set, "an opponent to join the game")
end

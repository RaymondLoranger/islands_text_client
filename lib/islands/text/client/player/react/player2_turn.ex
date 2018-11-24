defmodule Islands.Text.Client.Player.React.Player2Turn do
  alias Islands.Text.Client.Player.Wait
  alias Islands.Text.Client.{State, Summary}

  @spec maybe_wait(State.t()) :: State.t()
  def maybe_wait(%State{player_id: :player1} = state) do
    state
    |> Summary.display()
    |> Wait.wait_for(:player1_turn, "your opponent to play")
  end

  def maybe_wait(%State{player_id: :player2} = state), do: state
end

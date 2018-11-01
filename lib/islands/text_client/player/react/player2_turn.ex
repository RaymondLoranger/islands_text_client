defmodule Islands.TextClient.Player.React.Player2Turn do
  alias Islands.TextClient.Player.React.Wait
  alias Islands.TextClient.{State, Summary}

  @spec maybe_wait(State.t()) :: State.t()
  def maybe_wait(%State{player_id: :player1} = state) do
    state
    |> Summary.display()
    |> Wait.for(:player1_turn, "your opponent to play")
  end

  def maybe_wait(%State{player_id: :player2} = state), do: state
end

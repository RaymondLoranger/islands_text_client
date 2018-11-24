defmodule Islands.Text.Client.Player.React.PlayersSet do
  alias Islands.Engine.Game.Tally
  alias Islands.Text.Client.Player.Wait
  alias Islands.Text.Client.{State, Summary}

  @spec maybe_wait(State.t()) :: State.t()
  def maybe_wait(
        %State{
          player_id: :player1,
          tally: %Tally{player1_state: :islands_set}
        } = state
      ) do
    state
    |> Summary.display()
    |> Wait.wait_for(:player1_turn, "your opponent to set islands")
  end

  def maybe_wait(
        %State{
          player_id: :player2,
          tally: %Tally{player2_state: :islands_set}
        } = state
      ) do
    state
    |> Summary.display()
    |> Wait.wait_for(:player2_turn, "your opponent to set islands and play")
  end

  def maybe_wait(%State{} = state), do: state
end

defmodule Islands.TextClient.Player.React.PlayersSet do
  @moduledoc false

  alias Islands.Engine
  alias Islands.Engine.Tally
  alias Islands.TextClient.Player.React.Wait
  alias Islands.TextClient.{State, Summary}

  @spec maybe_wait(State.t()) :: State.t()
  def maybe_wait(
        %State{
          player_id: :player1,
          tally: %Tally{player1_state: :islands_set}
        } = state
      ) do
    state
    |> Summary.display()
    |> Wait.for(:player1_turn, "your opponent to set islands")
  end

  def maybe_wait(
        %State{
          player_id: :player2,
          tally: %Tally{player2_state: :islands_set}
        } = state
      ) do
    state
    |> Summary.display()
    |> Wait.for(:player2_turn, "your opponent to set islands and play")
  end

  def maybe_wait(%State{} = state), do: state
end

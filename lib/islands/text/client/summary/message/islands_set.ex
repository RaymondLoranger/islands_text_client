defmodule Islands.Text.Client.Summary.Message.IslandsSet do
  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Tally
  alias Islands.Text.Client.State

  @spec message(State.t()) :: ANSI.ansilist()
  def message(%State{
        player_id: player_id,
        tally: %Tally{request: {:set_islands, player_id}}
      }) do
    [
      :dark_green_background,
      :light_white,
      "Islands set."
    ]
  end

  def message(%State{tally: %Tally{request: {:set_islands, _player_id}}}) do
    [
      :dark_green_background,
      :light_white,
      "Opponent's islands set."
    ]
  end
end

defmodule Islands.Text.Client.Summary.Message.Stopping do
  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Tally
  alias Islands.Text.Client.State

  @spec message(State.t()) :: ANSI.ansilist()
  def message(%State{tally: %Tally{request: {:stop, _player_id}}}) do
    [
      :dark_green_background,
      :light_white,
      "Stopping the game..."
    ]
  end
end
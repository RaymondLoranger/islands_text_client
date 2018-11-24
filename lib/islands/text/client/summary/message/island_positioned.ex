defmodule Islands.Text.Client.Summary.Message.IslandPositioned do
  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Tally
  alias Islands.Text.Client.Summary.{Island, Point}
  alias Islands.Text.Client.State

  @spec message(State.t()) :: ANSI.ansilist()
  def message(%State{
        tally: %Tally{
          request: {:position_island, _player_id, island_type, row, col}
        }
      }) do
    [
      :dark_green_background,
      :light_white,
      "#{Island.format(island_type)} positioned at #{Point.format(row, col)}."
    ]
  end
end

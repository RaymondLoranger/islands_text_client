defmodule Islands.Text.Client.Summary.Message.AllIslandsPositioned do
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
      "#{Island.format(island_type)} positioned at #{Point.format(row, col)}. ",
      "ALL ISLANDS POSITIONED."
    ]
  end

  def message(%State{
        tally: %Tally{request: {:position_all_islands, _player_id}}
      }) do
    [
      :dark_green_background,
      :light_white,
      "ALL ISLANDS POSITIONED."
    ]
  end
end

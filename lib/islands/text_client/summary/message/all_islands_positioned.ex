defmodule Islands.TextClient.Summary.Message.AllIslandsPositioned do
  @moduledoc false

  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Tally
  alias Islands.TextClient.State
  alias Islands.TextClient.Summary.Message.{Island, Point}

  @spec message(State.t()) :: ANSI.ansilist()
  def message(%State{
        tally: %Tally{
          request: {:position_island, _player_id, island_type, row, col}
        }
      }) do
    [
      :dark_green_background,
      :light_white,
      "#{Island.for(island_type)} positioned at #{Point.for(row, col)}. ",
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

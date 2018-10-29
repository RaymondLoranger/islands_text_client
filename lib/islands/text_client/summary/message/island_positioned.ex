defmodule Islands.TextClient.Summary.Message.IslandPositioned do
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
      "#{Island.for(island_type)} positioned at #{Point.for(row, col)}."
    ]
  end
end

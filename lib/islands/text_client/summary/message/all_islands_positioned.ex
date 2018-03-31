defmodule Islands.TextClient.Summary.Message.AllIslandsPositioned do
  @moduledoc false

  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Tally

  alias Islands.TextClient.{
    State,
    Summary.Message.Island,
    Summary.Message.Point
  }

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
      "ALL POSITIONED."
    ]
  end
end

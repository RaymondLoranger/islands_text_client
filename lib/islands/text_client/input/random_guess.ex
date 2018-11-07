defmodule Islands.TextClient.Input.RandomGuess do
  use PersistConfig

  alias Islands.Engine.Coord
  alias Islands.Engine.Game.Tally
  alias Islands.Engine.Guesses
  alias Islands.TextClient.State

  @board_range Application.get_env(@app, :board_range)
  @create_empty_board_set Application.get_env(@app, :create_empty_board_set)
  @empty_board_set @create_empty_board_set.(@board_range)

  @dialyzer {:nowarn_function, new: 1}
  @spec new(State.t()) :: String.t()
  def new(
        %State{tally: %Tally{guesses: %Guesses{hits: hits, misses: misses}}} =
          _state
      ) do
    %Coord{row: row, col: col} =
      @empty_board_set
      |> MapSet.difference(hits)
      |> MapSet.difference(misses)
      |> Enum.random()

    "#{row} #{col}"
  end
end

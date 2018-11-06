defmodule Islands.TextClient.Input.RandomGuess do
  use PersistConfig

  alias Islands.Engine.Coord
  alias Islands.Engine.Game.Tally
  alias Islands.Engine.Guesses
  alias Islands.TextClient.State

  @board_range Application.get_env(@app, :board_range)

  @spec pick_guess(State.t()) :: [Coord.row() | Coord.col()]
  def pick_guess(
        %State{tally: %Tally{guesses: %Guesses{hits: hits, misses: misses}}} =
          _state
      ) do
    %Coord{row: row, col: col} =
      for row <- @board_range, col <- @board_range, into: MapSet.new() do
        {:ok, coord} = Coord.new(row, col)
        coord
      end
      |> MapSet.difference(hits)
      |> MapSet.difference(misses)
      |> Enum.random()

    [row, col]
  end
end

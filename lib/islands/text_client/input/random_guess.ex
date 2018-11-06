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
    coords =
      for row <- @board_range, col <- @board_range do
        {:ok, coord} = Coord.new(row, col)
        coord
      end

    %Coord{row: row, col: col} =
      coords
      |> Enum.reject(&MapSet.member?(hits, &1))
      |> Enum.reject(&MapSet.member?(misses, &1))
      |> Enum.random()

    [row, col]
  end
end

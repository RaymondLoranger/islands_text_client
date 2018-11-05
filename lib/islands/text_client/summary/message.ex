defmodule Islands.TextClient.Summary.Message do
  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Server
  alias Islands.Engine.Game.Tally.Score
  alias Islands.TextClient.State

  alias Islands.TextClient.Summary.Message.{
    AllIslandsPositioned,
    Error,
    HitIslandForested,
    HitNoneForested,
    IslandPositioned,
    IslandsSet,
    MissNoneForested,
    Other,
    Player2Added,
    Stopping
  }

  @spec new(State.t(), Server.response()) :: ANSI.ansilist()
  def new(state, response)
  def new(state, {:ok, :player2_added}), do: Player2Added.message(state)
  def new(state, {:ok, :island_positioned}), do: IslandPositioned.message(state)

  def new(state, {:ok, :all_islands_positioned}),
    do: AllIslandsPositioned.message(state)

  def new(state, {:ok, :islands_set}), do: IslandsSet.message(state)
  def new(state, {:hit, :none, :no_win}), do: HitNoneForested.message(state)
  def new(state, {:hit, _type, _status}), do: HitIslandForested.message(state)
  def new(state, {:miss, :none, :no_win}), do: MissNoneForested.message(state)
  def new(state, {:ok, :stopping}), do: Stopping.message(state)
  def new(state, {:error, _reason}), do: Error.message(state)
  def new(state, _other), do: Other.message(state)

  @spec new(Score.t()) :: ANSI.ansilist()
  def new(board_or_guesses)

  def new(%Score{type: :board, hits: hits, misses: misses} = _board),
    do: ["\n", ANSI.cursor_right(8)] ++ message_end(hits, misses)

  def new(%Score{type: :guesses, hits: hits, misses: misses}),
    do: [ANSI.cursor_up(1), ANSI.cursor_right(41)] ++ message_end(hits, misses)

  ## Private functions

  @spec message_end(non_neg_integer, non_neg_integer) :: ANSI.ansilist()
  defp message_end(hits, misses) do
    [
      :chartreuse_yellow,
      "hits: ",
      :spring_green,
      String.pad_leading("#{hits}", 2),
      :chartreuse_yellow,
      "   misses: ",
      :spring_green,
      String.pad_leading("#{misses}", 2)
    ]
  end
end

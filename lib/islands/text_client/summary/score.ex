defmodule Islands.TextClient.Summary.Score do
  @moduledoc false

  alias IO.ANSI.Plus, as: ANSI

  @spec for({atom, non_neg_integer, non_neg_integer}) :: ANSI.ansilist()
  def for({:board_score, hits, misses}) do
    [
      "\n",
      ANSI.cursor_right(8),
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

  def for({:guesses_score, hits, misses}) do
    [
      ANSI.cursor_up(1),
      ANSI.cursor_right(41),
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

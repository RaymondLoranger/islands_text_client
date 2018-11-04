defmodule Islands.TextClient.Summary.Score do
  alias IO.ANSI.Plus, as: ANSI

  @spec message_for({atom, non_neg_integer, non_neg_integer}) :: ANSI.ansilist()
  def message_for({:board_score, hits, misses}),
    do: ["\n", ANSI.cursor_right(8)] ++ message_end(hits, misses)

  def message_for({:guesses_score, hits, misses}),
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

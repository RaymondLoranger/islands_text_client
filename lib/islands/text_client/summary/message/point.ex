defmodule Islands.TextClient.Summary.Message.Point do
  alias Islands.Engine.Coord

  @spec for(Coord.row(), Coord.col()) :: String.t()
  def for(row, col), do: "(#{row}, #{col})"
end

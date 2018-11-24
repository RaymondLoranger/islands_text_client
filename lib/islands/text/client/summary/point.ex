defmodule Islands.Text.Client.Summary.Point do
  alias Islands.Engine.Coord

  @spec format(Coord.row(), Coord.col()) :: String.t()
  def format(row, col), do: "(#{row}, #{col})"
end

defmodule Islands.TextClient.IslandType do
  alias Islands.Engine.Island

  @spec island_type_for(String.codepoint()) :: Island.type() | {:error, atom}
  def island_type_for("a"), do: :atoll
  def island_type_for("d"), do: :dot
  def island_type_for("l"), do: :l_shape
  def island_type_for("s"), do: :s_shape
  def island_type_for("q"), do: :square
  def island_type_for(_), do: {:error, :invalid_island_type_code}
end

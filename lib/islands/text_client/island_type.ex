defmodule Islands.TextClient.IslandType do
  alias Islands.Engine.Island

  @spec new(String.codepoint()) :: Island.type() | {:error, atom}
  def new(island_type_code)
  def new("a"), do: :atoll
  def new("d"), do: :dot
  def new("l"), do: :l_shape
  def new("s"), do: :s_shape
  def new("q"), do: :square
  def new(_), do: {:error, :invalid_island_type_code}
end

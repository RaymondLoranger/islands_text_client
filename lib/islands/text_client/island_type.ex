defmodule Islands.TextClient.IslandType do
  @moduledoc false

  alias Islands.Engine.Island

  @spec for(String.codepoint()) :: Island.type() | {:error, atom}
  def for("a"), do: :atoll
  def for("d"), do: :dot
  def for("l"), do: :l_shape
  def for("s"), do: :s_shape
  def for("q"), do: :square
  def for(_), do: {:error, :invalid_island_type_code}
end

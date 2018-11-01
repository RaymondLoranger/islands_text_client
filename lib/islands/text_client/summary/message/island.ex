defmodule Islands.TextClient.Summary.Message.Island do
  alias Islands.Engine.Island

  @spec for(Island.type()) :: String.t()
  def for(island_type) do
    island_type |> Atom.to_string() |> String.upcase()
  end
end

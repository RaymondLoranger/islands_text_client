defmodule Islands.TextClient.Summary.Message do
  @moduledoc false

  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Server
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

  @spec for(State.t(), Server.response()) :: ANSI.ansilist()
  def for(state, response)
  def for(state, {:ok, :player2_added}), do: Player2Added.message(state)
  def for(state, {:ok, :island_positioned}), do: IslandPositioned.message(state)

  def for(state, {:ok, :all_islands_positioned}),
    do: AllIslandsPositioned.message(state)

  def for(state, {:ok, :islands_set}), do: IslandsSet.message(state)
  def for(state, {:hit, :none, :no_win}), do: HitNoneForested.message(state)
  def for(state, {:hit, _type, _status}), do: HitIslandForested.message(state)
  def for(state, {:miss, :none, :no_win}), do: MissNoneForested.message(state)
  def for(state, {:ok, :stopping}), do: Stopping.message(state)
  def for(state, {:error, _reason}), do: Error.message(state)
  def for(state, _other), do: Other.message(state)
end

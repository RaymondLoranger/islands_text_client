defmodule Islands.TextClient.Summary.Message do
  @moduledoc false

  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game

  alias Islands.TextClient.{
    State,
    Summary.Message.AllIslandsPositioned,
    Summary.Message.Error,
    Summary.Message.HitIslandForested,
    Summary.Message.HitNoneForested,
    Summary.Message.IslandPositioned,
    Summary.Message.IslandsSet,
    Summary.Message.MissNoneForested,
    Summary.Message.Other,
    Summary.Message.Player2Added,
    Summary.Message.Stopping
  }

  @spec for(State.t(), Game.response()) :: ANSI.ansilist()
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

defmodule Islands.TextClient.Summary.Message do
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

  @spec message_for(State.t(), Server.response()) :: ANSI.ansilist()
  def message_for(state, response)
  def message_for(state, {:ok, :player2_added}), do: Player2Added.message(state)

  def message_for(state, {:ok, :island_positioned}),
    do: IslandPositioned.message(state)

  def message_for(state, {:ok, :all_islands_positioned}),
    do: AllIslandsPositioned.message(state)

  def message_for(state, {:ok, :islands_set}), do: IslandsSet.message(state)

  def message_for(state, {:hit, :none, :no_win}),
    do: HitNoneForested.message(state)

  def message_for(state, {:hit, _type, _status}),
    do: HitIslandForested.message(state)

  def message_for(state, {:miss, :none, :no_win}),
    do: MissNoneForested.message(state)

  def message_for(state, {:ok, :stopping}), do: Stopping.message(state)
  def message_for(state, {:error, _reason}), do: Error.message(state)
  def message_for(state, _other), do: Other.message(state)
end

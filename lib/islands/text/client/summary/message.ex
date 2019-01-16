defmodule Islands.Text.Client.Summary.Message do
  use PersistConfig

  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Board.Score
  alias Islands.Engine.Game.Server

  alias Islands.Text.Client.Summary.Message.{
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

  alias Islands.Text.Client.{IslandType, State}

  @island_type_codes Application.get_env(@app, :island_type_codes)
  @sp ANSI.cursor_right()

  @spec new(State.t(), Server.response()) :: ANSI.ansilist()
  def new(state, response)
  def new(state, {:ok, :player2_added}), do: Player2Added.message(state)
  def new(state, {:ok, :island_positioned}), do: IslandPositioned.message(state)

  def new(state, {:ok, :all_islands_positioned}),
    do: AllIslandsPositioned.message(state)

  def new(state, {:ok, :islands_set}), do: IslandsSet.message(state)
  def new(state, {:hit, :none, :no_win}), do: HitNoneForested.message(state)
  def new(state, {:hit, _type, _status}), do: HitIslandForested.message(state)
  def new(state, {:miss, :none, :no_win}), do: MissNoneForested.message(state)
  def new(state, {:ok, :stopping}), do: Stopping.message(state)
  def new(state, {:error, _reason}), do: Error.message(state)
  def new(state, _other), do: Other.message(state)

  @spec new(Score.t()) :: ANSI.ansilist()
  def new(%Score{type: :player} = score) do
    [
      ["\n", ANSI.cursor_right(8), top_message(score)],
      ["\n", ANSI.cursor_right(8), bottom_message(score)]
    ]
  end

  def new(%Score{type: :opponent} = score) do
    [
      [ANSI.cursor_up(3)],
      ["\n", ANSI.cursor_right(41), top_message(score)],
      ["\n", ANSI.cursor_right(41), bottom_message(score)]
    ]
  end

  ## Private functions

  @spec top_message(Score.t()) :: ANSI.ansilist()
  defp top_message(score) do
    [
      [:chartreuse_yellow, "hits: "],
      [:spring_green, String.pad_leading("#{score.hits}", 2)],
      [:chartreuse_yellow, "   misses: "],
      [:spring_green, String.pad_leading("#{score.misses}", 2)]
    ]
  end

  @spec bottom_message(Score.t()) :: ANSI.ansilist()
  defp bottom_message(score) do
    [
      [[:reset, :spring_green, :underline], "forested"],
      [[:reset, @sp, :chartreuse_yellow], "=>"],
      forested_codes(score)
    ]
  end

  @spec forested_codes(Score.t()) :: ANSI.ansilist()
  defp forested_codes(score) do
    for code <- @island_type_codes do
      [attr(IslandType.new(code) in score.forested), code]
    end
  end

  @spec attr(boolean) :: ANSI.ansilist()
  defp attr(true = _forested?), do: [:reset, @sp, :spring_green, :underline]
  defp attr(false = _forested?), do: [:reset, @sp, :chartreuse_yellow]
end

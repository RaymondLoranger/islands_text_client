defmodule Islands.Text.Client.Player.React.GameOver.Message do
  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Server

  alias Islands.Text.Client.Player.React.GameOver.Message.{
    GuessCoord,
    Other,
    Stop
  }

  alias Islands.Text.Client.State

  @spec new(State.t(), Server.request()) :: ANSI.ansilist()
  def new(state, {:guess_coord, _player_id, _row, _col}),
    do: GuessCoord.message(state)

  def new(state, {:stop, _player_id}), do: Stop.message(state)
  def new(state, _other), do: Other.message(state)
end

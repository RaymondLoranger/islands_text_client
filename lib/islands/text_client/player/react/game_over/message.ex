defmodule Islands.TextClient.Player.React.GameOver.Message do
  @moduledoc false

  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Server

  alias Islands.TextClient.Player.React.GameOver.Message.{
    GuessCoord,
    Other,
    Stop
  }

  alias Islands.TextClient.State

  @spec for(State.t(), Server.request()) :: ANSI.ansilist()
  def for(state, {:guess_coord, _player_id, _row, _col}) do
    GuessCoord.message(state)
  end

  def for(state, {:stop, _player_id}), do: Stop.message(state)
  def for(state, _other), do: Other.message(state)
end

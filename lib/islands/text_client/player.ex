defmodule Islands.TextClient.Player do
  # @moduledoc """
  # Models an Islands game player.
  # """
  @moduledoc false

  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Tally
  alias Islands.TextClient.Player.React
  alias Islands.TextClient.Player.React.GameOver
  alias Islands.TextClient.{Mover, Prompter, State, Summary}

  # :initialized, :players_set, :player1_turn, :player2_turn, :game_over
  @spec play(State.t()) :: no_return
  def play(%State{tally: %Tally{game_state: game_state}} = state) do
    state |> React.to(game_state) |> continue()
  end

  ## Private functions

  @spec continue(State.t()) :: no_return
  defp continue(%State{tally: %Tally{game_state: :game_over}} = state) do
    state
    |> Summary.display()
    |> GameOver.message()
    |> ANSI.format()
    |> IO.puts()

    GameOver.clear_messages()
    exit(:normal)
  end

  defp continue(state) do
    state
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.make_move()
    |> play()
  end
end

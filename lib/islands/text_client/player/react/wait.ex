defmodule Islands.TextClient.Player.React.Wait do
  @moduledoc false

  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine
  alias Islands.Engine.State, as: StateMachine
  alias Islands.TextClient.State

  @spec for(State.t(), StateMachine.game_state(), String.t()) :: State.t()
  def for(state, game_state, phrase) do
    [
      :free_speech_red_background,
      :light_white,
      "#{state.player_name}, please wait for #{phrase}..."
    ]
    |> ANSI.format()
    |> IO.puts()

    wait_for(game_state)
    put_in(state.tally, Engine.tally(state.game_name, state.player_id))
  end

  ## Private functions

  @spec wait_for(StateMachine.game_state()) :: :ok
  defp wait_for(:players_set) do
    receive do
      :players_set -> :ok
      :game_over -> :ok
    end
  end

  defp wait_for(:player1_turn) do
    receive do
      :player1_turn -> :ok
      :game_over -> :ok
    end
  end

  defp wait_for(:player2_turn) do
    receive do
      :player2_turn -> :ok
      :game_over -> :ok
    end
  end
end

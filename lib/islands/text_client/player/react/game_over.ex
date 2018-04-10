defmodule Islands.TextClient.Player.React.GameOver do
  @moduledoc false

  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine
  alias Islands.Engine.Tally
  alias Islands.TextClient.Player.React.GameOver.Message
  alias Islands.TextClient.{State, Summary}

  @spec end_game(State.t()) :: no_return
  def end_game(%State{} = state), do: state |> message() |> end_game(state)

  @spec end_game(ANSI.ansilist(), State.t()) :: no_return
  def end_game(message, %State{game_name: game_name} = state) do
    Summary.display(state)
    message |> ANSI.format() |> IO.puts()
    Engine.end_game(game_name)
    clear_messages()
    Process.exit(self(), :normal)
  end

  @spec message(State.t()) :: ANSI.ansilist()
  def message(%State{tally: %Tally{request: request}} = state) do
    Message.for(state, request)
  end

  @spec clear_messages :: :ok
  def clear_messages do
    receive do
      _ -> clear_messages()
    after
      0 -> :ok
    end
  end
end

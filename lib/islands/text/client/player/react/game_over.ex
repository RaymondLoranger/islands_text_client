defmodule Islands.Text.Client.Player.React.GameOver do
  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Tally
  alias Islands.Engine
  alias Islands.Text.Client.Player.React.GameOver.Message
  alias Islands.Text.Client.{State, Summary}

  @spec end_game(State.t()) :: no_return
  def end_game(%State{} = state), do: state |> message() |> end_game(state)

  @spec end_game(ANSI.ansilist(), State.t()) :: no_return
  def end_game(message, %State{game_name: game_name} = state) do
    Summary.display(state)
    ANSI.puts(message)
    Engine.end_game(game_name)
    clear_messages()
    self() |> Process.exit(:normal)
  end

  @spec message(State.t()) :: ANSI.ansilist()
  def message(%State{tally: %Tally{request: request}} = state),
    do: Message.new(state, request)

  @spec clear_messages :: :ok
  def clear_messages do
    receive do
      _ -> clear_messages()
    after
      0 -> :ok
    end
  end
end
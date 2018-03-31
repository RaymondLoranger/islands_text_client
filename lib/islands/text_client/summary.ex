defmodule Islands.TextClient.Summary do
  # @moduledoc """
  # Displays a summary of the Islands game.
  # """
  @moduledoc false

  alias IO.ANSI.Plus, as: ANSI
  alias IO.ANSI.Table
  alias Islands.Engine.{Grid, Tally}
  alias Islands.TextClient.{State, Summary.Message}

  @spec display(State.t(), ANSI.ansilist()) :: State.t()
  def display(state, message \\ [])

  def display(%State{tally: %Tally{response: response}} = state, []) do
    state |> Message.for(response) |> do_display(state)
  end

  def display(state, message), do: do_display(message, state)

  ## Private functions

  @spec do_display(ANSI.ansilist(), State.t()) :: State.t()
  defp do_display(
         message,
         %State{tally: %Tally{board: board, guesses: guesses}} = state
       ) do
    message |> ANSI.format() |> IO.puts()
    board |> Grid.to_maps() |> Table.format()
    guesses |> Grid.to_maps() |> Table.format(margins: [left: 35, top: -12])
    state
  end
end

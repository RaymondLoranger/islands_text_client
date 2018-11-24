defmodule Islands.Text.Client.Summary do
  @moduledoc """
  Displays the summary of a _Game of Islands_.
  """

  alias IO.ANSI.Plus, as: ANSI
  alias IO.ANSI.Table
  alias Islands.Engine.Game.Tally.Score
  alias Islands.Engine.Game.{Grid, Tally}
  alias Islands.Text.Client.Summary.Message
  alias Islands.Text.Client.State

  @margins [margins: [left: 35, top: -12]]

  @spec display(State.t(), ANSI.ansilist()) :: State.t()
  def display(state, message \\ [])

  def display(%State{tally: %Tally{response: response}} = state, []),
    do: state |> Message.new(response) |> do_display(state)

  def display(state, message), do: do_display(message, state)

  ## Private functions

  @spec do_display(ANSI.ansilist(), State.t()) :: State.t()
  defp do_display(
         message,
         %State{tally: %Tally{board: board, guesses: guesses}} = state
       ) do
    ANSI.puts(message)
    board |> Score.new() |> Message.new() |> ANSI.puts()
    guesses |> Score.new() |> Message.new() |> ANSI.puts()
    board |> Grid.new() |> Grid.to_maps() |> Table.format()
    guesses |> Grid.new() |> Grid.to_maps() |> Table.format(@margins)
    # Default function => &Islands.Engine.Game.Grid.Tile.new/1
    # fun = &Islands.Text.Client.Summary.Tile.new/1
    # board |> Grid.new() |> Grid.to_maps(fun) |> Table.format()
    # guesses |> Grid.new() |> Grid.to_maps(fun) |> Table.format(@margins)
    state
  end
end

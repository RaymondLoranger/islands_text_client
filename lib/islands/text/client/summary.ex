defmodule Islands.Text.Client.Summary do
  @moduledoc """
  Displays the Score of a _Game of Islands_.
  """

  use PersistConfig

  alias __MODULE__.Message
  alias IO.ANSI.Plus, as: ANSI
  alias IO.ANSI.Table
  alias Islands.Engine.Board.Score
  alias Islands.Engine.Game.{Grid, Tally}
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
         %State{
           game_name: game_name,
           player_id: player_id,
           tally: %Tally{board: board, guesses: guesses}
         } = state
       ) do
    ANSI.puts(message)
    game_name |> Score.board_side(player_id) |> Message.puts()
    game_name |> Score.guesses_side(player_id) |> Message.puts()
    board |> Grid.new() |> Grid.to_maps() |> Table.format()
    guesses |> Grid.new() |> Grid.to_maps() |> Table.format(@margins)
    # Default function => &Islands.Engine.Game.Grid.Tile.new/1
    # fun = &Islands.Text.Client.Score.Tile.new/1
    # board |> Grid.new() |> Grid.to_maps(fun) |> Table.format()
    # guesses |> Grid.new() |> Grid.to_maps(fun) |> Table.format(@margins)
    state
  end
end

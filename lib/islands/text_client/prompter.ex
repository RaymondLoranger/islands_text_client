defmodule Islands.TextClient.Prompter do
  # @moduledoc """
  # Prompts an Islands game player.
  # """
  @moduledoc false

  alias IO.ANSI.Plus, as: ANSI
  alias Islands.TextClient.{Input, State, Summary}

  @spec accept_move(State.t(), ANSI.ansilist()) :: State.t() | no_return
  def accept_move(state, message \\ [])
  def accept_move(state, []), do: do_accept_move(state)

  def accept_move(state, message) do
    state |> Summary.display(message) |> do_accept_move()
  end

  # Private functions

  @spec do_accept_move(State.t()) :: State.t() | no_return
  defp do_accept_move(%State{player_name: player_name} = state) do
    [:light_white, "#{player_name}, your move (or help):", :reset, " "]
    |> ANSI.format()
    |> IO.gets()
    |> Input.check(state)
  end
end

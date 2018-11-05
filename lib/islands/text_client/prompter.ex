defmodule Islands.TextClient.Prompter do
  @moduledoc """
  Prompts a _Game of Islands_ player.
  """

  alias IO.ANSI.Plus, as: ANSI
  alias Islands.TextClient.{Input, State, Summary}

  @timeout_in_ms 10

  @spec accept_move(State.t(), ANSI.ansilist()) :: State.t() | no_return
  def accept_move(state, message \\ [])
  def accept_move(state, []), do: do_accept_move(state)

  def accept_move(state, message),
    do: state |> Summary.display(message) |> do_accept_move()

  # Private functions

  @spec do_accept_move(State.t()) :: State.t() | no_return
  defp do_accept_move(%State{player_name: player_name} = state) do
    # Clear :stdio buffer...
    spawn(fn ->
      Process.group_leader() |> GenServer.call(:contents, @timeout_in_ms)
    end)

    [:light_white, "#{player_name}, your move (or help):", :reset, " "]
    |> ANSI.format()
    |> IO.gets()
    |> Input.check(state)
  end
end

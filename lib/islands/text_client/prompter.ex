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
    flush_stdio()

    [:light_white, "#{player_name}, your move (or help):", :reset, " "]
    |> ANSI.gets()
    |> Input.check(state)
  end

  @spec flush_stdio :: true
  defp flush_stdio do
    pid = spawn(fn -> IO.read(:all) end)
    Process.sleep(@timeout_in_ms)
    Process.exit(pid, :kill)
  end
end

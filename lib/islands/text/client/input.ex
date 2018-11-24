defmodule Islands.Text.Client.Input do
  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Text.Client.Input.{Checker, Getter}
  alias Islands.Text.Client.State

  @type t :: IO.chardata() | IO.nodata()

  @spec get_input(ANSI.ansilist(), State.t()) :: t()
  defdelegate get_input(prompt, state), to: Getter

  @spec check_input(t, State.t()) :: State.t() | no_return
  defdelegate check_input(input, state), to: Checker
end

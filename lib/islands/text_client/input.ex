defmodule Islands.TextClient.Input do
  alias IO.ANSI.Plus, as: ANSI
  alias Islands.TextClient.Input.{Checker, Getter}
  alias Islands.TextClient.State

  @type t :: IO.chardata() | IO.nodata()

  @spec get_input(ANSI.ansilist(), State.t()) :: t()
  defdelegate get_input(prompt, state), to: Getter

  @spec check_input(t, State.t()) :: State.t() | no_return
  defdelegate check_input(input, state), to: Checker
end

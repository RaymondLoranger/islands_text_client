defmodule Islands.Text.Client.Player.React.GameOver.Message.Other do
  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Text.Client.State

  @spec message(State.t()) :: ANSI.ansilist()
  def message(%State{} = state) do
    [
      :fuchsia_background,
      :light_white,
      "Game over for an unknown reason...",
      :reset,
      "\nState: #{inspect(state, pretty: true)}"
    ]
  end
end

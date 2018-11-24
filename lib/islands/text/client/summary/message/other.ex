defmodule Islands.Text.Client.Summary.Message.Other do
  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Tally
  alias Islands.Text.Client.State

  @spec message(State.t()) :: ANSI.ansilist()
  def message(%State{tally: %Tally{response: response, request: request}}) do
    [
      :dark_green_background,
      :light_white,
      "Unknown response...",
      :reset,
      "\n#{inspect(request, pretty: true)} => ",
      "\n#{inspect(response, pretty: true)}"
    ]
  end
end

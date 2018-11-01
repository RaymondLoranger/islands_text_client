defmodule Islands.TextClient.Summary.Message.Other do
  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Tally
  alias Islands.TextClient.State

  @spec message(State.t()) :: ANSI.ansilist()
  def message(%State{tally: %Tally{response: response, request: request}}) do
    [
      :dark_green_background,
      :light_white,
      "#{inspect(request)} => #{inspect(response)}"
    ]
  end
end

defmodule Islands.TextClient.RemoteProcedureCall.IslandsEngineNotStarted do
  alias IO.ANSI.Plus, as: ANSI

  @spec message :: ANSI.ansilist()
  def message,
    do: [:fuchsia_background, :light_white, "Islands Engine not started."]
end

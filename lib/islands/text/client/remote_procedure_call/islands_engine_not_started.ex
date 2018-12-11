defmodule Islands.Text.Client.RemoteProcedureCall.IslandsEngineNotStarted do
  alias IO.ANSI.Plus, as: ANSI

  @spec message(atom) :: ANSI.ansilist()
  def message(:nodedown) do
    [
      :fuchsia_background,
      :light_white,
      "Islands Engine not started (actually `islands` node is down)."
    ]
  end

  def message(:nodeup) do
    [
      :fuchsia_background,
      :light_white,
      "Islands Engine not started (although `islands` node is up)."
    ]
  end
end

defmodule Islands.Text.Client.Options do
  @moduledoc """
  Gets the options of the _Game of Islands_.
  """

  @default_options [mode: :manual, pause: 0]
  @pause_range 0..10_000

  @spec get(Keyword.t()) :: tuple
  def get(options) do
    options = Keyword.merge(@default_options, options)
    mode = options[:mode]
    pause = options[:pause]

    pause =
      cond do
        pause < @pause_range.first -> @pause_range.first
        pause > @pause_range.last -> @pause_range.last
        true -> pause
      end

    {mode, pause}
  end
end

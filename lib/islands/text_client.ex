# ┌───────────────────────────────────────────────────────────────────────┐
# │ Inspired by the book "Functional Web Development" by Lance Halvorsen. │
# │ Also inspired by the course "Elixir for Programmers" by Dave Thomas.  │
# └───────────────────────────────────────────────────────────────────────┘
defmodule Islands.TextClient do
  use PersistConfig

  @book_ref Application.get_env(@app, :book_ref)

  @moduledoc """
  Text client for the _Game of Islands_.
  \n##### #{@book_ref}
  """

  alias __MODULE__.Interact

  # @spec start(String.t(), String.t()) :: no_return
  defdelegate start(game_name, player1_name), to: Interact

  # @spec join(String.t(), String.t()) :: no_return
  defdelegate join(game_name, player2_name), to: Interact
end

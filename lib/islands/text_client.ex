# ┌─────────────────────────────────────────────────────────────────┐
# │ Inspired by the course "Elixir for Programmers" by Dave Thomas. │
# └─────────────────────────────────────────────────────────────────┘
defmodule Islands.TextClient do
  use PersistConfig

  @book_and_course_ref Application.get_env(@app, :book_and_course_ref)

  @moduledoc """
  Text client for the Islands game.

  ##### #{@book_and_course_ref}
  """

  alias __MODULE__.Interact

  @doc """
  Lets player1 start a game.

  App `:islands_engine` must run in node `:islands@<hostname>`...
  - `cd islands_engine`
  - `iex --sname islands -S mix`
  - `:observer.start()`

  Each client must run in a different node...
  - `cd islands_text_client`
  - `iex --sname c[lient]<n> -S mix`

  Player 1 starts a game from her node:
  - `Islands.TextClient.start("Eve")`
  """
  defdelegate start(game_name), to: Interact

  @doc """
  Lets player2 join a game.

  Player 2 joins a game from his node:
  - `Islands.TextClient.join("Eve", "Adam")`
  """
  defdelegate join(game_name, player_name), to: Interact
end

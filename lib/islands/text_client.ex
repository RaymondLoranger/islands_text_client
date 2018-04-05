# ┌───────────────────────────────────────────────────────────────────────┐
# │ Inspired by the book "Functional Web Development" by Lance Halvorsen. │
# │ Also inspired by the course "Elixir for Programmers" by Dave Thomas.  │           │
# └───────────────────────────────────────────────────────────────────────┘
defmodule Islands.TextClient do
  use PersistConfig

  @book_ref Application.get_env(@app, :book_ref)

  @moduledoc """
  Text client for the Islands game.

  ##### #{@book_ref}
  """

  alias __MODULE__.Interact

  @doc """
  Lets player1 start a game.

  App `:islands_engine` must run in node `:islands@<hostname>`...
  - `cd islands_engine`
  - `iex --sname islands -S mix`
  - `:observer.start()`

  Player1 must run in her node...
  - `cd islands_text_client`
  - `iex --sname game<i>_player1 -S mix`

  Player 1 starts a game from her node:
  - `Islands.TextClient.start("Eve")`
  """
  defdelegate start(game_name), to: Interact

  @doc """
  Lets player2 join a game.

  Player2 must run in his node...
  - `cd islands_text_client`
  - `iex --sname game<i>_player2 -S mix`

  Player 2 joins a game from his node:
  - `Islands.TextClient.join("Eve", "Adam")`
  """
  defdelegate join(game_name, player_name), to: Interact
end

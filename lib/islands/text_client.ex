# ┌───────────────────────────────────────────────────────────────────────┐
# │ Inspired by the book "Functional Web Development" by Lance Halvorsen. │
# │ Also inspired by the course "Elixir for Programmers" by Dave Thomas.  │
# └───────────────────────────────────────────────────────────────────────┘
defmodule Islands.TextClient do
  use PersistConfig

  @book_ref Application.get_env(@app, :book_ref)

  @moduledoc """
  Text client for the Game of Islands.

  ##### #{@book_ref}
  """

  alias __MODULE__.Interact

  @doc """
  Lets player1 start a game.

  App `islands_engine` must run in node with short name `islands`...
  - `cd islands_engine`
  - `iex --sname islands -S mix`
  - `:observer.start() # optional`

  Player1 runs in a node with any short name (here `client1`)...
  - `cd islands_text_client`
  - `iex --sname client1 -S mix`

  Player1 (here "Eve") starts a game from her node like so:
  - `Islands.TextClient.start("Eve")`
  """
  defdelegate start(game_name), to: Interact

  @doc """
  Lets player2 join a game.

  Player2 runs in a node with any short name (here `client2`)...
  - `cd islands_text_client`
  - `iex --sname client2 -S mix`

  Player2 (here "Adam") joins a game from his node like so:
  - `Islands.TextClient.join("Eve", "Adam")`
  """
  defdelegate join(game_name, player_name), to: Interact
end

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

  @doc """
  Lets player1 start a game.

  App `islands_engine` must run in node with short name `islands`...
  - `cd islands_engine`
  - `iex --sname islands -S mix`
  - `:observer.start() # optional`

  Player1 runs in a node with any short name (here `client1`)...
  - `cd islands_text_client`
  - `iex --sname client1 -S mix`

  Player1 (`Adam`) starts a game (`Eden`) from his node like so:
  - `Islands.TextClient.start("Eden", "Adam")`

  ## Options

    - `:mode` - (`:manual` or `:auto`) specifies whether player1 will play
    in manual or auto mode; defaults to `:manual`.
    - `:pause` - (positive integer) specifies the duration in milliseconds of the pause between moves in auto mode (should be between 1 and 9,999); defaults to 1 millisecond.
  """
  @spec start(String.t(), String.t(), Keyword.t()) :: no_return
  defdelegate start(game_name, player1_name, options \\ []), to: Interact

  @doc """
  Lets player2 join a game.

  Player2 runs in a node with any short name (here `client2`)...
  - `cd islands_text_client`
  - `iex --sname client2 -S mix`

  Player2 (`Eve`) joins game `Eden` from her node like so:
  - `Islands.TextClient.join("Eden", "Eve")`

  ## Options

    - `:mode` - (`:manual` or `:auto`) specifies whether player2 will play
    in manual or auto mode; defaults to `:manual`.
    - `:pause` - (positive integer) specifies the duration in milliseconds of the pause between moves in auto mode (should be between 1 and 9,999); defaults to 1 millisecond.
  """
  @spec join(String.t(), String.t(), Keyword.t()) :: no_return
  defdelegate join(game_name, player2_name, options \\ []), to: Interact
end

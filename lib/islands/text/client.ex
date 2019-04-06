# ┌──────────────────────────────────────────────────────────────────┐
# │ Inspired by the course "Elixir for Programmers" by Dave Thomas.  │
# │ And by the book "Functional Web Development" by Lance Halvorsen. │
# └──────────────────────────────────────────────────────────────────┘
defmodule Islands.Text.Client do
  use PersistConfig

  @course_ref Application.get_env(@app, :course_ref)

  @moduledoc """
  Text client for the _Game of Islands_.
  \n##### #{@course_ref}
  """

  alias __MODULE__.{Joiner, Starter}
  alias Islands.Player

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
  - `Islands.Text.Client.start("Eden", "Adam")`

  ## Options

    - `:mode` - (`:manual` or `:auto`) specifies whether player1 will play
    in manual or auto mode; defaults to `:manual`.
    - `:pause` - (nonnegative integer) specifies the duration in milliseconds
    of the pause between moves in auto mode (should be between 0 and 10,000);
    defaults to 0 milliseconds.
  """
  @spec start(String.t(), String.t(), Player.gender(), Keyword.t()) :: no_return
  defdelegate start(game_name, player1_name, gender, options \\ []), to: Starter

  @doc """
  Lets player2 join a game.

  Player2 runs in a node with any short name (here `client2`)...
  - `cd islands_text_client`
  - `iex --sname client2 -S mix`

  Player2 (`Eve`) joins game `Eden` from her node like so:
  - `Islands.Text.Client.join("Eden", "Eve")`

  ## Options

    - `:mode` - (`:manual` or `:auto`) specifies whether player2 will play
    in manual or auto mode; defaults to `:manual`.
    - `:pause` - (nonnegative integer) specifies the duration in milliseconds
    of the pause between moves in auto mode (should be between 0 and 10,000);
    defaults to 0 milliseconds.
  """
  @spec join(String.t(), String.t(), Player.gender(), Keyword.t()) :: no_return
  defdelegate join(game_name, player2_name, gender, options \\ []), to: Joiner
end

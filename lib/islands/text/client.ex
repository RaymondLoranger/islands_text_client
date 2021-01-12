# ┌───────────────────────────────────────────────────────────────────────┐
# │ Inspired by the book "Functional Web Development" by Lance Halvorsen. │
# │ Also inspired by the course "Elixir for Programmers" by Dave Thomas.  │
# └───────────────────────────────────────────────────────────────────────┘
defmodule Islands.Text.Client do
  @moduledoc """
  Text client for the _Game of Islands_.

  ##### Inspired by the book [Functional Web Development](https://pragprog.com/book/lhelph/functional-web-development-with-elixir-otp-and-phoenix) by Lance Halvorsen.

  ##### Also inspired by the course [Elixir for Programmers](https://codestool.coding-gnome.com/courses/elixir-for-programmers) by Dave Thomas.
  """

  use PersistConfig

  alias __MODULE__.{Joiner, Starter}
  alias Islands.{Game, Player}

  @doc """
  Lets player1 start a game.

  App `islands_engine` must run in node with short name `islands`...
  - `cd islands_engine`
  - `iex --sname islands -S mix`
  - `:observer.start # optional to observe the game(s) being played`

  Player1 runs in a node with any short name (here `client1`)...
  - `cd islands_text_client`
  - `iex --sname client1 -S mix`

  Player1 (`Adam`) starts a game (`Eden`) from his node like so:
  - `Islands.Text.Client.start("Eden", "Adam", :m)`

  ## Parameters

    - `game_name`    - game name (string)
    - `player1_name` - player1 name (string)
    - `gender`       - gender as either :f or :m (atom)
    - `options`      - up to 2 options (keyword)

  ## Options

    - `:mode` - (`:manual` or `:auto`) specifies whether player1 will play
    in manual or auto mode; defaults to `:manual`.
    - `:pause` - (nonnegative integer) specifies the duration in milliseconds
    of the pause between moves in auto mode (should be between 0 and 10,000);
    defaults to 0 milliseconds.
  """
  @spec start(Game.name(), Player.name(), Player.gender(), Keyword.t()) ::
          no_return
  defdelegate start(game_name, player1_name, gender, options \\ []), to: Starter

  @doc """
  Lets player2 join a game.

  Player2 runs in a node with any short name (here `client2`)...
  - `cd islands_text_client`
  - `iex --sname client2 -S mix`

  Player2 (`Eve`) joins game `Eden` from her node like so:
  - `Islands.Text.Client.join("Eden", "Eve", :f)`

  ## Parameters

    - `game_name`    - game name (string)
    - `player2_name` - player2 name (string)
    - `gender`       - gender as either :f or :m (atom)
    - `options`      - up to 2 options (keyword)

  ## Options

    - `:mode` - (`:manual` or `:auto`) specifies whether player2 will play
    in manual or auto mode; defaults to `:manual`.
    - `:pause` - (nonnegative integer) specifies the duration in milliseconds
    of the pause between moves in auto mode (should be between 0 and 10,000);
    defaults to 0 milliseconds.
  """
  @spec join(Game.name(), Player.name(), Player.gender(), Keyword.t()) ::
          no_return
  defdelegate join(game_name, player2_name, gender, options \\ []), to: Joiner

  @doc """
  Returns the islands engine node.

  ## Examples

    iex> alias Islands.Text.Client
    iex> Client.engine_node
    :islands_engine@rays # :dev or :test environments
  """
  @spec engine_node :: node
  def engine_node, do: get_env(:engine_node)
end

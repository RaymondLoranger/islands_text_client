# ┌───────────────────────────────────────────────────────────────────────┐
# │ Inspired by the book "Functional Web Development" by Lance Halvorsen. │
# │ Also inspired by the course "Elixir for Programmers" by Dave Thomas.  │
# └───────────────────────────────────────────────────────────────────────┘
defmodule Islands.Text.Client do
  @moduledoc """
  Text client for the _Game of Islands_.

  ##### Inspired by the book [Functional Web Development](https://pragprog.com/titles/lhelph/functional-web-development-with-elixir-otp-and-phoenix/) by Lance Halvorsen.

  ##### Also inspired by the course [Elixir for Programmers](https://codestool.coding-gnome.com/courses/elixir-for-programmers) by Dave Thomas.
  """

  use PersistConfig

  alias __MODULE__.{Joiner, Starter}
  alias Islands.{Game, Player}

  @doc """
  Lets player1 start a game on a remote node.

  App `:islands_engine` must run on node `:islands_engine@<hostname>` where
  `<hostname>` is either the full host name if long names are used, or the first
  part of the full host name if short names are used.

  ### Short names

  Start the engine using a short name:

  ```
  cd islands_engine
  iex --sname islands_engine -S mix
  :observer.start # optional
  ```

  Player1 starts a game from a different node using a short name:

  ```
  cd islands_text_client
  iex --sname client1 -S mix
  Islands.Text.Client.start("Eden", "Adam", :m)
  ```

  ### Long names

  Start the engine using a long name:

  ```
  cd islands_engine
  iex --name islands_engine@rays.supratech.ca -S mix
  :observer.start # optional
  ```

  Player1 starts a game from a different node using a long name:

  ```
  cd islands_text_client
  iex --name client1@rays.supratech.ca -S mix
  Islands.Text.Client.start("Eden", "Adam", :m)
  ```

  ## Parameters

    - `game_name`    - game name (string)
    - `player1_name` - player1 name (string)
    - `gender`       - gender as either `:f` or `:m` (atom)
    - `options`      - up to 2 options (keyword)

  ## Options

    - `:mode` - (`:manual` or `:auto`) specifies whether player1 will play
    in manual or auto mode; defaults to `:manual`.
    - `:pause` - (nonnegative integer) specifies the duration in milliseconds
    of the pause between moves in auto mode (should be between 0 and 10,000);
    defaults to `0` milliseconds.
  """
  @spec start(Game.name(), Player.name(), Player.gender(), Keyword.t()) ::
          no_return
  defdelegate start(game_name, player1_name, gender, options \\ []), to: Starter

  @doc """
  Lets player2 join a game on a remote node.

  ### Short names

  Player2 joins a game from a different node using a short name:

  ```
  cd islands_text_client
  iex --sname client2 -S mix
  Islands.Text.Client.join("Eden", "Eve", :f)
  ```

  ### Long names

  Player2 joins a game from a different node using a long name:

  ```
  cd islands_text_client
  iex --name client2@rays.supratech.ca -S mix
  Islands.Text.Client.join("Eden", "Eve", :f)
  ```

  ## Parameters

    - `game_name`    - game name (string)
    - `player2_name` - player2 name (string)
    - `gender`       - gender as either `:f` or `:m` (atom)
    - `options`      - up to 2 options (keyword)

  ## Options

    - `:mode` - (`:manual` or `:auto`) specifies whether player2 will play
    in manual or auto mode; defaults to `:manual`.
    - `:pause` - (nonnegative integer) specifies the duration in milliseconds
    of the pause between moves in auto mode (should be between 0 and 10,000);
    defaults to `0` milliseconds.
  """
  @spec join(Game.name(), Player.name(), Player.gender(), Keyword.t()) ::
          no_return
  defdelegate join(game_name, player2_name, gender, options \\ []), to: Joiner

  @doc ~S"""
  Returns the islands engine node.

  ## Examples

      iex> alias Islands.Text.Client
      iex> engine_node = Client.engine_node
      iex> "#{engine_node}" =~ "islands_engine@"
      true
  """
  @spec engine_node :: node
  def engine_node, do: get_env(:engine_node)
end

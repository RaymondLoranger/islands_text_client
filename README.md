# Islands Text Client

[![Build Status](https://travis-ci.org/RaymondLoranger/islands_text_client.svg?branch=master)](https://travis-ci.org/RaymondLoranger/islands_text_client)

Text client for the _Game of Islands_.

It’s a game for two players, and each player has a board, which consists of a
grid of one hundred coordinates. The grid is labeled with the numbers 1 through
10 across the top for the columns and down the left side for the rows. We name
individual coordinates with this row-column combination.

The players cannot see each other’s boards.

The players have matching sets of islands of various shapes and sizes, which
they place on their own boards. The players can move the islands around as
much as they like until they say that they are set. After that, the islands must
stay where they are for the rest of the game.

Once both players have set their islands, they take turns guessing coordinates
on their opponent’s board, trying to find the islands. For every correct guess,
we plant a palm tree on the island at that coordinate. When all the coordinates
for an island have palm trees, the island is forested.

The first player to forest all of her opponent’s islands is the winner.

##### Inspired by the book [Functional Web Development](https://pragprog.com/book/lhelph/functional-web-development-with-elixir-otp-and-phoenix) by Lance Halvorsen.<br>Also inspired by the course [Elixir for Programmers](https://codestool.coding-gnome.com/courses/elixir-for-programmers) by Dave Thomas.

## Usage

To play the _Game of Islands_, clone `islands_engine` from GitHub and compile it:

  - git clone https://github.com/RaymondLoranger/islands_engine
  - cd islands_engine
  - mix deps.get
  - mix compile

Then, clone `islands_text_client` from GitHub and compile it:

  - git clone https://github.com/RaymondLoranger/islands_text_client
  - cd islands_text_client
  - mix deps.get
  - mix compile

You would then run the engine in node `:islands@<hostname>` specifying short name `islands`:

  - cd islands_engine
  - iex --sname `islands` -S mix # short name must be `islands`
  - :observer.start # optional to observe the game(s) being played

Player1 starts the game from a different node using any short name:

  - cd islands_text_client
  - iex --sname `client1` -S mix # short name is `client1` for example
  - Islands.Text.Client.start("Eden", "Adam", `:m`) # gender is `:m`

Player2 joins the game from yet another node using any short name:

  - cd islands_text_client
  - iex --sname `client2` -S mix # short name is `client2` for example
  - Islands.Text.Client.join("Eden", "Eve", `:f`) # gender is `:f`

Multiple games can be played simultaneously in this fashion.

## Notes

When starting a game, a player can specify "auto mode" with a pause duration
(in milliseconds) between moves:

Example:

  - cd islands_text_client
  - iex --sname client1 -S mix
  - Islands.Text.Client.start("Eden", "Adam", :m, `mode: :auto, pause: 5000`)

Likewise when joining a game, a player can specify "auto mode" with a pause
duration (in milliseconds) between moves:

Example:

  - cd islands_text_client
  - iex --sname client2 -S mix
  - Islands.Text.Client.join("Eden", "Eve", :f, `mode: :auto, pause: 3000`)

  The default mode is `:manual` and the default pause is `0` milliseconds.

  Any combination of modes is possible for the two players.

## Video

This video shows a game initially in manual mode then switched to auto mode:
<video src="assets/demo.mp4" poster="assets/player1_guess1.jpg" width="320" height="200" controls preload></video>


# Islands Text Client

[![Build Status](https://travis-ci.org/RaymondLoranger/islands_text_client.svg?branch=master)](https://travis-ci.org/RaymondLoranger/islands_text_client)

Text client for the _Game of Islands_.

It’s a game for two players, and each player has a board, which consists of a
grid of one hundred squares. The grid is labeled with the numbers 1 through
10 across the top for the columns and down the left side for the rows. Each square is named by its coordinates of the form (row, column).

The players cannot see each other’s boards.

The players have matching sets of islands of various shapes and sizes, which
they place on their own boards. The players can move the islands around as
much as they like until they say that they are set. After that, the islands must
stay where they are for the rest of the game.

Once both players have set their islands, they take turns guessing squares
on their opponent’s board, trying to find the islands. For every correct guess,
we plant a palm tree on the island at that square. When all the squares
of an island have palm trees, the island is forested.

The first player to forest all of her opponent’s islands is the winner.

##### Inspired by the book [Functional Web Development](https://pragprog.com/book/lhelph/functional-web-development-with-elixir-otp-and-phoenix) by Lance Halvorsen.

##### Also inspired by the course [Elixir for Programmers](https://codestool.coding-gnome.com/courses/elixir-for-programmers) by Dave Thomas.

## Usage

To play the _Game of Islands_, clone `islands_engine` and compile it:

```
git clone https://github.com/RaymondLoranger/islands_engine
cd islands_engine
mix deps.get
mix compile
```

Then, clone `islands_text_client` and compile it:

```
git clone https://github.com/RaymondLoranger/islands_text_client
cd islands_text_client
mix deps.get
mix compile
```

You would then run the engine in node `:islands_engine@<hostname>` specifying
short name `islands_engine`:

```
cd islands_engine
iex --sname islands_engine -S mix
:observer.start # optional
```

Player1 starts the game from a different node using any short name:

```
cd islands_text_client
iex --sname client1 -S mix
Islands.Text.Client.start("Eden", "Adam", :m)
```

Player2 joins the game from yet another node using any short name:

```
cd islands_text_client
iex --sname client2 -S mix
Islands.Text.Client.join("Eden", "Eve", :f)
```

Multiple games can be played simultaneously in this fashion.

## Notes

When starting a game, a player can specify "auto mode" with a pause duration
(in milliseconds) between moves:

Example:

```
cd islands_text_client
iex --sname client1 -S mix
Islands.Text.Client.start("Eden", "Adam", :m, mode: :auto, pause: 5000)
```

Likewise when joining a game, a player can specify "auto mode" with a pause
duration (in milliseconds) between moves:

Example:

```
cd islands_text_client
iex --sname client2 -S mix
Islands.Text.Client.join("Eden", "Eve", :f, mode: :auto, pause: 3000)
```

The default mode is `:manual` and the default pause is `0` milliseconds.

Any combination of modes is possible for the two players.

## Video

This video shows a game initially in manual mode and then switched to auto mode:

[![Game of Islands - Video](assets/video.jpg)](https://photos.app.goo.gl/q2AvWisHL3Q6kcER9)

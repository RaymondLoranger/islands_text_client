# IslandsTextClient

 Text client for the Islands game.

##### Inspired by the book [Functional Web Development](https://pragprog.com/book/lhelph/functional-web-development-with-elixir-otp-and-phoenix) by Lance Halvorsen.</br>Also inspired by the course [Elixir for Programmers](https://codestool.coding-gnome.com/courses/elixir-for-programmers) by Dave Thomas.

## Using

To play the Islands game, clone `islands_engine` from GitHub and compile it:

  - git clone https://github.com/RaymondLoranger/islands_engine
  - cd islands_engine
  - mix deps.get
  - mix compile

Then, clone `islands_text_client` from GitHub and compile it:

  - git clone https://github.com/RaymondLoranger/islands_text_client
  - cd islands_text_client
  - mix deps.get
  - mix compile

From folder `islands_engine`, run the engine in node `:islands@<hostname>`:

  - cd islands_engine
  - iex --sname islands -S mix
  - :observer.start() # optional

The first player starts the game from a different node:

  - cd islands_text_client
  - iex --sname <game1_player1> -S mix
  - Islands.TextClient.start("<player1>")

The second player joins the game from yet another node:

  - cd islands_text_client
  - iex --sname <game1_player2> -S mix
  - Islands.TextClient.join("<player1>", "<player2>")

## Example of a game's events in sequence
## ![engine_node](images/engine_node.png)
## ![player1_node](images/player1_node.png)
## ![player2_node](images/player2_node.png)
## ![player1_start](images/player1_start.png)
## ![player2_join](images/player2_join.png)
## ![player1_react_join](images/player1_react_join.png)
## ![player1_atoll_positioned](images/player1_atoll_positioned.png)
## ![player2_atoll_positioned](images/player2_atoll_positioned.png)
## ![player1_square_positioned](images/player1_square_positioned.png)
## ![player2_square_positioned](images/player2_square_positioned.png)
## ![player1_set_islands](images/player1_set_islands.png)
## ![player2_set_islands](images/player2_set_islands.png)
## ![player1_react_set_islands](images/player1_react_set_islands.png)
## ![player1_guess1](images/player1_guess1.png)
## ![player2_react_guess1](images/player2_react_guess1.png)
## ![player2_guess1](images/player2_guess1.png)
## ![player1_react_guess1](images/player1_react_guess1.png)
## ![player1_atoll_forested](images/player1_atoll_forested.png)
## ![player2_react_atoll_forested](images/player2_react_atoll_forested.png)

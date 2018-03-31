use Mix.Config

config :islands_text_client, board_range: 1..10

config :islands_text_client,
  help_message: [
    :chartreuse_yellow,
    "● position island: ",
    :spring_green,
    "<code> <row> <col>",
    :chartreuse_yellow,
    "\n  where code is: ",
    :spring_green,
    "a",
    :chartreuse_yellow,
    "toll | ",
    :spring_green,
    "d",
    :chartreuse_yellow,
    "ot | ",
    :spring_green,
    "l",
    :chartreuse_yellow,
    "_shape | ",
    :spring_green,
    "s",
    :chartreuse_yellow,
    "_shape | s",
    :spring_green,
    "q",
    :chartreuse_yellow,
    "uare",
    :chartreuse_yellow,
    "\n● set islands: ",
    :spring_green,
    "set",
    :chartreuse_yellow,
    "\n● make a guess: ",
    :spring_green,
    "<row> <col>",
    :chartreuse_yellow,
    "\n● stop: ",
    :spring_green,
    "stop",
    :chartreuse_yellow,
    "\n● help: ",
    :spring_green,
    "help"
  ]

# "a" => :atoll, "d" => :dot, "l" => :l_shape, "s" => :s_shape, "q" => :square
config :islands_text_client, island_type_codes: ["a", "d", "l", "s", "q"]

# Here {:ok, 'rays'}...
{:ok, hostname} = :inet.gethostname()

# Here :islands@rays...
islands_node = List.to_atom('islands@' ++ hostname)

config :islands_text_client, islands_node: islands_node

config :islands_text_client,
  valid_move_message: [
    :free_speech_red_background,
    :light_white,
    "Please enter a valid move (or help)."
  ]

use Mix.Config

config :io_ansi_table,
  align_specs: [
    right: "row",
    center: 1,
    center: 2,
    center: 3,
    center: 4,
    center: 5,
    center: 6,
    center: 7,
    center: 8,
    center: 9,
    center: 10
  ]

config :io_ansi_table, bell: false
config :io_ansi_table, count: 10
config :io_ansi_table, headers: ["row", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
config :io_ansi_table, header_fixes: %{"Row" => ""}
config :io_ansi_table, margins: [top: 0]
config :io_ansi_table, sort_specs: ["row"]
config :io_ansi_table, sort_symbols: [asc: ""]
config :io_ansi_table, style: :game

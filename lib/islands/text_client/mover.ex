defmodule Islands.TextClient.Mover do
  # @moduledoc """
  # Makes an Islands game move.
  # """
  @moduledoc false

  use PersistConfig

  alias Islands.Engine
  alias Islands.TextClient.{IslandType, State}

  @board_range Application.get_env(@app, :board_range)
  @island_type_codes Application.get_env(@app, :island_type_codes)

  @spec make_move(State.t()) :: State.t()
  def make_move(%State{move: [code, row, col]} = state)
      when code in @island_type_codes and row in @board_range and
             col in @board_range do
    %State{game_name: game_name, player_id: player_id} = state
    island_type = IslandType.for(code)
    tally = Engine.position_island(game_name, player_id, island_type, row, col)
    put_in(state.tally, tally)
  end

  def make_move(%State{move: [row, col]} = state)
      when row in @board_range and col in @board_range do
    %State{game_name: game_name, player_id: player_id} = state
    put_in(state.tally, Engine.guess_coord(game_name, player_id, row, col))
  end

  def make_move(%State{move: ["set"]} = state) do
    %State{game_name: game_name, player_id: player_id} = state
    put_in(state.tally, Engine.set_islands(game_name, player_id))
  end

  def make_move(%State{move: ["stop"]} = state) do
    %State{game_name: game_name, player_id: player_id} = state
    put_in(state.tally, Engine.stop_game(game_name, player_id))
  end
end

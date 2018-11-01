defmodule Islands.TextClient.Input do
  use PersistConfig

  alias Islands.TextClient.Player.React.GameOver
  alias Islands.TextClient.{Prompter, State}

  @type t :: String.t() | {:error, atom} | :eof

  @board_range Application.get_env(@app, :board_range)
  @help_message Application.get_env(@app, :help_message)
  @invalid_move_message Application.get_env(@app, :invalid_move_message)
  @island_type_codes Application.get_env(@app, :island_type_codes)

  @spec check(t, State.t()) :: State.t() | no_return
  def check({:error, reason}, state) do
    GameOver.end_game(["Game ended: #{reason}"], state)
  end

  def check(:eof, state) do
    GameOver.end_game(["Looks like you gave up."], state)
  end

  def check(input, %State{} = state) do
    input
    |> String.split()
    |> case do
      [code, row, col] when code in @island_type_codes ->
        with {row, ""} when row in @board_range <- Integer.parse(row),
             {col, ""} when col in @board_range <- Integer.parse(col),
             do: put_in(state.move, [code, row, col]),
             else: (_ -> Prompter.accept_move(state, @invalid_move_message))

      [row, col] ->
        with {row, ""} when row in @board_range <- Integer.parse(row),
             {col, ""} when col in @board_range <- Integer.parse(col),
             do: put_in(state.move, [row, col]),
             else: (_ -> Prompter.accept_move(state, @invalid_move_message))

      [] ->
        row = Enum.random(@board_range)
        col = Enum.random(@board_range)
        put_in(state.move, [row, col])

      [move] when move in ["all", "set", "stop"] ->
        put_in(state.move, [move])

      ["help"] ->
        Prompter.accept_move(state, @help_message)

      _other ->
        Prompter.accept_move(state, @invalid_move_message)
    end
  end
end

defmodule Islands.TextClient.Input.Checker do
  use PersistConfig

  alias Islands.TextClient.Input.RandomGuess
  alias Islands.TextClient.Input
  alias Islands.TextClient.Player.React.GameOver
  alias Islands.TextClient.{Prompter, State}

  @board_range Application.get_env(@app, :board_range)
  @help_message Application.get_env(@app, :help_message)
  @invalid_move_message Application.get_env(@app, :invalid_move_message)
  @island_type_codes Application.get_env(@app, :island_type_codes)

  @spec check_input(Input.t(), State.t()) :: State.t() | no_return
  def check_input({:error, reason}, state),
    do: GameOver.end_game(["Game ended: #{inspect(reason)}"], state)

  def check_input(:eof = reason, state),
    do: GameOver.end_game(["Game ended: #{inspect(reason)}"], state)

  def check_input(input, %State{} = state) do
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
        check_input(RandomGuess.new(state), state)

      [move] when move in ["all", "set", "stop"] ->
        put_in(state.move, [move])

      ["help"] ->
        Prompter.accept_move(state, @help_message)

      _other ->
        Prompter.accept_move(state, @invalid_move_message)
    end
  end
end

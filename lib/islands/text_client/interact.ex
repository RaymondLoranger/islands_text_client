defmodule Islands.TextClient.Interact do
  @moduledoc """
  Interacts with a client playing the _Game of Islands_.
  """

  use PersistConfig

  alias Islands.TextClient.{Player, RemoteProcedureCall, State}

  @default_options Application.get_env(@app, :default_options)
  @pause_range Application.get_env(@app, :pause_range)

  defguard valid_game_args(game_name, player_name, options)
           when is_binary(game_name) and is_binary(player_name) and
                  is_list(options)

  @spec start(String.t(), String.t(), Keyword.t()) :: no_return
  def start(game_name, player_name, options \\ [])
      when valid_game_args(game_name, player_name, options) do
    {mode, pause} = get_options(options)

    game_name
    |> RemoteProcedureCall.new_game(player_name)
    |> State.new(:player1, player_name, mode, pause)
    |> Player.play()
  end

  @spec join(String.t(), String.t(), Keyword.t()) :: no_return
  def join(game_name, player_name, options \\ [])
      when valid_game_args(game_name, player_name, options) do
    {mode, pause} = get_options(options)

    game_name
    |> RemoteProcedureCall.add_player(player_name)
    |> State.new(:player2, player_name, mode, pause)
    |> Player.play()
  end

  ## Private functions

  @spec get_options(Keyword.t()) :: tuple
  defp get_options(options) do
    options = Keyword.merge(@default_options, options)
    mode = options[:mode]
    pause = options[:pause]

    pause =
      cond do
        pause < @pause_range.first -> @pause_range.first
        pause > @pause_range.last -> @pause_range.last
        true -> pause
      end

    {mode, pause}
  end
end

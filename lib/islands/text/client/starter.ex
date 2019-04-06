defmodule Islands.Text.Client.Starter do
  @moduledoc """
  Allows to start the _Game of Islands_.
  """

  import Islands.Text.Client.Guard

  alias Islands.Text.Client.Options
  alias Islands.Client.{Player, RPC, State}
  alias Islands.Player, as: Gamer

  @spec start(String.t(), String.t(), Gamer.gender(), Keyword.t()) :: no_return
  def start(game_name, player_name, gender, options \\ [])
      when valid_game_args(game_name, player_name, gender, options) do
    {mode, pause} = Options.get(options)

    game_name
    |> RPC.new_game(player_name, gender)
    |> State.new(:player1, player_name, gender, mode, pause)
    |> Player.play()
  end
end

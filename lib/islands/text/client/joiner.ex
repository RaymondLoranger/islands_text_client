defmodule Islands.Text.Client.Joiner do
  @moduledoc """
  Allows to join the _Game of Islands_.
  """

  import Islands.Text.Client.Guard

  alias Islands.Text.Client.Options
  alias Islands.Client.{Player, RPC, State}
  alias Islands.Player, as: Gamer

  @spec join(String.t(), String.t(), Gamer.gender(), Keyword.t()) :: no_return
  def join(game_name, player_name, gender, options \\ [])
      when valid_game_args(game_name, player_name, gender, options) do
    {mode, pause} = Options.get(options)

    game_name
    |> RPC.add_player(player_name, gender)
    |> State.new(:player2, player_name, gender, mode, pause)
    |> Player.play()
  end
end

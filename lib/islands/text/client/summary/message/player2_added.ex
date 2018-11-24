defmodule Islands.Text.Client.Summary.Message.Player2Added do
  alias IO.ANSI.Plus, as: ANSI
  alias Islands.Engine.Game.Tally
  alias Islands.Text.Client.State

  @spec message(State.t()) :: ANSI.ansilist()
  def message(%State{
        player_id: :player1,
        tally: %Tally{request: {:add_player, name, _pid}}
      }) do
    [
      :dark_green_background,
      :light_white,
      "Your opponent, #{name}, has joined the game."
    ]
  end

  def message(%State{
        player_id: :player2,
        tally: %Tally{request: {:add_player, name, _pid}}
      }) do
    [
      :dark_green_background,
      :light_white,
      "#{name}, you've joined the game."
    ]
  end
end

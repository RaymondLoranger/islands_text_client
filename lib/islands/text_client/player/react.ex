defmodule Islands.TextClient.Player.React do
  alias Islands.Engine.Game.State, as: StateMachine

  alias Islands.TextClient.Player.React.{
    GameOver,
    Initialized,
    Player1Turn,
    Player2Turn,
    PlayersSet
  }

  alias Islands.TextClient.State

  # :initialized, :players_set, :player1_turn, :player2_turn, :game_over
  @spec react_to(State.t(), StateMachine.game_state()) :: State.t() | no_return
  def react_to(state, game_state)
  def react_to(state, :initialized), do: Initialized.wait(state)
  def react_to(state, :players_set), do: PlayersSet.maybe_wait(state)
  def react_to(state, :player1_turn), do: Player1Turn.maybe_wait(state)
  def react_to(state, :player2_turn), do: Player2Turn.maybe_wait(state)
  def react_to(state, :game_over), do: GameOver.end_game(state)
end

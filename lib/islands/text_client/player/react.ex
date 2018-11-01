defmodule Islands.TextClient.Player.React do
  alias Islands.Engine.Game.State, as: StateMachine

  alias Islands.TextClient.Player.React.{
    GameOver,
    Initialized,
    Player1Turn,
    Player2Turn,
    PlayersSet,
    State
  }

  alias Islands.TextClient.State

  # :initialized, :players_set, :player1_turn, :player2_turn, :game_over
  @spec to(State.t(), StateMachine.game_state()) :: State.t() | no_return
  def to(state, game_state)
  def to(state, :initialized), do: Initialized.wait(state)
  def to(state, :players_set), do: PlayersSet.maybe_wait(state)
  def to(state, :player1_turn), do: Player1Turn.maybe_wait(state)
  def to(state, :player2_turn), do: Player2Turn.maybe_wait(state)
  def to(state, :game_over), do: GameOver.end_game(state)
end

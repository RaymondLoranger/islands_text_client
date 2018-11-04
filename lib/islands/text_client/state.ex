defmodule Islands.TextClient.State do
  @moduledoc """
  Holds the state of a text client playing the _Game of Islands_.
  """

  alias __MODULE__
  alias Islands.Engine.Game.Tally
  alias Islands.Engine.Game
  alias Islands.Engine

  @enforce_keys [:game_name, :player_name, :player_id, :move, :tally]
  defstruct [:game_name, :player_name, :player_id, :move, :tally]

  @type t :: %State{
          game_name: String.t(),
          player_name: String.t(),
          player_id: Game.player_id(),
          move: [String.codepoint() | pos_integer | String.t()],
          tally: Tally.t()
        }

  @spec new(String.t(), Game.player_id(), String.t()) :: t
  def new(game_name, player_id, player_name) do
    %State{
      game_name: game_name,
      player_name: player_name,
      player_id: player_id,
      move: [],
      tally: Engine.tally(game_name, player_id)
    }
  end
end

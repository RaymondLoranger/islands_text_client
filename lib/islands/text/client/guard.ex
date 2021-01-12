defmodule Islands.Text.Client.Guard do
  @moduledoc """
  Defines a guard to start/join the _Game of Islands_.
  """

  defguard valid?(game_name, player_name, gender, options)
           when is_binary(game_name) and is_binary(player_name) and
                  gender in [:f, :m] and is_list(options)
end

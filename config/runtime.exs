import Config

engine_node =
  if config_env() == :prod do
    # long name -- 'hosts' file must map hostname to IP address
    # On Windows => C:\Windows\System32\Drivers\etc\hosts:
    # <n>.<n>.<n>.<n> rays.supratech.ca # FQDN of Erlang/Elixir long node name
    'islands_engine@rays.supratech.ca'
  else
    {:ok, hostname} = :inet.gethostname()
    # short name
    'islands_engine@' ++ hostname
  end

config :islands_text_client, engine_node: List.to_atom(engine_node)

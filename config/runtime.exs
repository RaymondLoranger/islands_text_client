import Config

# App `:islands_engine` should run on node `:islands_engine@<hostname>` where
# `<hostname>` is either the full host name if long names are used, or the first
# part of the full host name if short names are used.

{:ok, host_name} = :inet.gethostname()

engine_node =
  if config_env() == :prod do
    # File 'hosts' must map the host IP address to the full host name.
    # On Windows => C:\Windows\System32\Drivers\etc\hosts:
    # <n>.<n>.<n>.<n> rays.supratech.ca # FQDN (fully qualified domain name)

    {:ok, {_, _, _, _, _, [{n1, n2, n3, n4} | _]}} =
      :inet.gethostbyname(host_name, :inet)

    {:ok, {_, full_name, _, _, _, _}} =
      :inet.gethostbyaddr('#{n1}.#{n2}.#{n3}.#{n4}')

    # long names used => :"islands_engine@rays.supratech.ca"
    :"islands_engine@#{full_name}"
  else
    # short names used => :islands_engine@rays
    :"islands_engine@#{host_name}"
  end

config :islands_text_client, engine_node: engine_node

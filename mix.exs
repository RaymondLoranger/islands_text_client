defmodule IslandsTextClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :islands_text_client,
      version: "0.1.14",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      name: "Islands Text Client",
      source_url: source_url(),
      description: description(),
      package: package(),
      aliases: aliases(),
      deps: deps(),
      dialyzer: [plt_add_apps: [:islands_engine]]
    ]
  end

  defp source_url do
    "https://github.com/RaymondLoranger/islands_text_client"
  end

  defp description do
    """
    Text client for the Islands game.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "config/persist*.exs"],
      maintainers: ["Raymond Loranger"],
      licenses: ["MIT"],
      links: %{"GitHub" => source_url()}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      included_applications: [:islands_engine],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mix_tasks,
       github: "RaymondLoranger/mix_tasks", only: :dev, runtime: false},
      {:persist_config, "~> 0.1"},
      {:io_ansi_table, "~> 0.4"},
      {:islands_engine, "~> 0.1"},
      {:earmark, "~> 1.0", only: :dev},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      docs: ["docs", &copy_images/1]
    ]
  end

  defp copy_images(_) do
    File.cp_r("images", "doc/images", fn src, dst ->
      # Always true...
      src || dst

      # IO.gets(~s|Overwriting "#{dst}" with "#{src}".\nProceed? [Yn]\s|) in [
      #   "y\n",
      #   "Y\n"
      # ]
    end)
  end
end

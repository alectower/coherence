defmodule Coherence.Mixfile do
  use Mix.Project

  @version "0.6.0"

  def project do
    [
      app: :coherence,
      version: @version,
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      docs: [extras: ["README.md"], main: "Coherence"],
      deps: deps(),
      package: package(),
      dialyzer: [plt_add_apps: [:mix]],
      name: "Coherence",
      description: """
      A full featured, configurable authentication and user management system for Phoenix.
      """
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: {Coherence, []},
      extra_applications: [
        :logger
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]

  defp deps do
    [
      {:bcrypt_elixir, "~> 1.1"},
      {:comeonin, "~> 4.0"},
      {:credo, "~> 0.8", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:earmark, "~> 1.2", only: :dev, override: true},
      {:ecto_sql, "~> 3.0"},
      {:elixir_uuid, "~> 1.2"},
      {:ex_doc, "~> 0.18.0", only: :dev},
      {:floki, "~> 0.36", only: :test},
      {:gettext, "~> 0.14"},
      {:jason, "~> 1.0"},
      {:mochiweb, "~> 3.5", override: true},
      {:phoenix, "~> 1.6.17"},
      {:phoenix_html, "~> 2.12 or ~> 3.0"},
      {:phoenix_swoosh, "~> 0.2 or ~> 1.0"},
      {:plug, ">= 1.7.1"},
      {:postgrex, ">= 0.14.0", only: :test},
      {:ssl_verify_fun, "~> 1.1.7", override: true},
      {:timex, "~> 3.3"},
    ]
  end

  defp package do
    [
      maintainers: ["Stephen Pallen"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/smpallen99/coherence"},
      files: ~w(lib priv README.md mix.exs LICENSE)
    ]
  end
end

defmodule Rsvp.Mixfile do
  use Mix.Project

  def project do
    [
      app: :rsvp,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger,:postgrex,:ecto],
      mod: {Rsvp.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 2.2"},
      {:postgrex, "~> 0.13.3"}
    ]
  end

  defp aliases do
    [
      "init": ["ecto.create","ecto.migrate","run priv/repo/seed.exs"]
    ]
  end

end

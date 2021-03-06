defmodule TheTavern.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  defp deps do
    [
      {:faker, "~> 0.13", only: :test},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
      {:credo, "~> 1.3", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [
      check: ["clean", "compile", "credo"],
      compile: ["compile --force --warnings-as-errors"],
      credo: ["credo --strict"],
      format: ["format", "cmd --app the_tavern_web 'npm --prefix assets run format'"]
    ]
  end
end

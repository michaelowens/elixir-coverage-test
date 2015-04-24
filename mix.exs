defmodule Portal.Mixfile do
  use Mix.Project

  def project do
    [app: :portal,
     name: "Portal",
     version: "0.0.1",
     source_url: "https://github.com/michaelowens",
     homepage_url: "https://michaelowens.nl",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     test_coverage: [tool: ExCoveralls]]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger],
     mod: {Portal, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:earmark, ">= 0.0.0"},
     {:ex_doc, "~> 0.7", only: :dev},
     {:excoveralls, "~> 0.3", only: [:dev, :test]}]
  end
end

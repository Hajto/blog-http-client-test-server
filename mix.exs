defmodule HttpClientTest.Mixfile do
  use Mix.Project

  def project do
    [app: :http_client_test,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [applications: [:cowboy, :plug, :ibrowse, :httpotion, :httpoison],
     extra_applications: [:logger],
     mod: {HttpClientTest.Application, []}]
  end

  defp deps do
    [{:cowboy, "~> 1.0.0"},
     {:plug, "~> 1.0"},
     {:ibrowse, "~> 4.4"},
     {:httpotion, "~> 3.0.2"},
     {:httpoison, "~> 0.12"},


     # Dev dependencies
     {:mix_docker, "~> 0.5.0"}
    ]
  end
end

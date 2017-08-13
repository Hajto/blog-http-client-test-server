defmodule HttpClientTest.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    require Logger

    port = Application.get_env(:http_client_test, :port, 8080)

    Logger.info "Application is starting"
    Logger.info "HTTP server will be bound to #{port}"
    Logger.info "Targeting #{Test.Handler.test_site}"

    # Define workers and child supervisors to be supervised
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Test.Router, [], [port: String.to_integer(port)])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HttpClientTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

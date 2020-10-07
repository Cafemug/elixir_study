defmodule WebTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      WebTest.Repo,
      # Start the Telemetry supervisor
      WebTestWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: WebTest.PubSub},
      # Start the Endpoint (http/https)
      WebTestWeb.Endpoint
      # Start a worker by calling: WebTest.Worker.start_link(arg)
      # {WebTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WebTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WebTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

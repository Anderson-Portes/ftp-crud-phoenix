defmodule FtpPhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      FtpPhoenix.Repo,
      # Start the Telemetry supervisor
      FtpPhoenixWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: FtpPhoenix.PubSub},
      # Start the Endpoint (http/https)
      FtpPhoenixWeb.Endpoint
      # Start a worker by calling: FtpPhoenix.Worker.start_link(arg)
      # {FtpPhoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FtpPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FtpPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

defmodule Snkz.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SnkzWeb.Telemetry,
      # Start the Ecto repository
      Snkz.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Snkz.PubSub},
      # Start Finch
      {Finch, name: Snkz.Finch},
      # Start the Endpoint (http/https)
      SnkzWeb.Endpoint
      # Start a worker by calling: Snkz.Worker.start_link(arg)
      # {Snkz.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Snkz.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SnkzWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

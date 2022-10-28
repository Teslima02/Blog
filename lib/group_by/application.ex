defmodule GroupBy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GroupBy.Repo,
      # Start the Telemetry supervisor
      GroupByWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GroupBy.PubSub},
      # Start the Endpoint (http/https)
      GroupByWeb.Endpoint
      # Start a worker by calling: GroupBy.Worker.start_link(arg)
      # {GroupBy.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GroupBy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GroupByWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

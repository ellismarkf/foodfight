defmodule Foodfight.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FoodfightWeb.Telemetry,
      Foodfight.Repo,
      {DNSCluster, query: Application.get_env(:foodfight, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Foodfight.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Foodfight.Finch},
      # Start a worker by calling: Foodfight.Worker.start_link(arg)
      # {Foodfight.Worker, arg},
      # Start to serve requests, typically the last entry
      FoodfightWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Foodfight.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FoodfightWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

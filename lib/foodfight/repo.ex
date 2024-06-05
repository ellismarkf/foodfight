defmodule Foodfight.Repo do
  use Ecto.Repo,
    otp_app: :foodfight,
    adapter: Ecto.Adapters.Postgres
end

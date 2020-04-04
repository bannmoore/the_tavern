defmodule TheTavern.Repo do
  use Ecto.Repo,
    otp_app: :the_tavern,
    adapter: Ecto.Adapters.Postgres
end

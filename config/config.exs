# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :the_tavern,
  ecto_repos: [TheTavern.Repo]

config :the_tavern_web,
  ecto_repos: [TheTavern.Repo],
  generators: [context_app: :the_tavern]

# Configures the endpoint
config :the_tavern_web, TheTavernWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eCDHvts1IB5fLXbpp1XrJYbm8onQtjLx9+T+8SrwyfiHfJi2+b6fHw7rFx5uOUg3",
  render_errors: [view: TheTavernWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TheTavernWeb.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "JHFwQDCa"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

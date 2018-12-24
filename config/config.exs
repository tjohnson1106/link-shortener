# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :shorten,
  ecto_repos: [Shorten.Repo]

# Configures the endpoint
config :shorten, ShortenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zziWxHbbL3jGBdarHlybg22GnPv8rHeXXiXdTQtLaZH/PWsge17j2LlgcDKdvT6O",
  render_errors: [view: ShortenWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Shorten.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :shorten, Shorten.Repo, adapter: EctoMnesia.Adapter

config :ecto_mnesia,
  host: {:system, :atom, "MNESIA_HOST", Kernel.node()},
  storage_type: {:system, :atom, "MNESIA_STORAGE_TYPE", :disc_copies}

config :mnesia,
  dir: "priv/data/mnesia"

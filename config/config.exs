# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bump_tracker,
  ecto_repos: [BumpTracker.Repo]

# Configures the endpoint
config :bump_tracker, BumpTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3fS2R2k6hjj6scTAI7QrTp63zmcrAvapAskn9eA3ndldmYRjWR9HE4o96S4Sxhzn",
  render_errors: [view: BumpTrackerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BumpTracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

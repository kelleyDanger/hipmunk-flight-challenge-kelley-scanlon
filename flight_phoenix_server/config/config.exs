# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hipmunk_kelley,
  ecto_repos: [HipmunkKelley.Repo]

# Configures the endpoint
config :hipmunk_kelley, HipmunkKelley.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7SXfCYtsx+RxKB32laqAHpZ/LCNkQ/9/ud3yfSZA/rE0CWzksMKyE1X/sYutjeMI",
  render_errors: [view: HipmunkKelley.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HipmunkKelley.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

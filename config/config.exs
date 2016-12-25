# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :how_to_watch_tv,
  ecto_repos: [HowToWatchTv.Repo]

# Configures the endpoint
config :how_to_watch_tv, HowToWatchTv.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VxrR528O3BDlzvJjH9BYlssM5xMw42/4C668XS418JNpDGu3uL/wJ2VfNHfFVIs6",
  render_errors: [view: HowToWatchTv.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HowToWatchTv.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

if File.exists? "config/#{Mix.env}.secret.exs" do
  import_config "#{Mix.env}.secret.exs"
end

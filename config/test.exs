use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :how_to_watch_tv, HowToWatchTv.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :how_to_watch_tv, HowToWatchTv.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "how_to_watch_tv_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :how_to_watch_tv, BasicAuth,
  username: "user",
  password: "secret"

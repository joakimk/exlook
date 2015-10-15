use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :exlook, Exlook.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :exlook, Exlook.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("USER"),
  password: "",
  database: "exlook_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :exlook,
  user_token: "secret"

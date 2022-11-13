import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :ftp_phoenix, FtpPhoenix.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ftp_phoenix_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ftp_phoenix, FtpPhoenixWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "W9k2EzrhwBmr4xaXxnNd2twN9XIViwhf4qY4CmSByiCFxzaUuAP4Y0xqd9S/xJFO",
  server: false

# In test we don't send emails.
config :ftp_phoenix, FtpPhoenix.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

defmodule FtpPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :ftp_phoenix,
    adapter: Ecto.Adapters.Postgres
end

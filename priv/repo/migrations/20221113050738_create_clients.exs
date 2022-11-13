defmodule FtpPhoenix.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :server_url, :string
      add :server_user, :string
      add :server_password, :string
      add :register_code, :string
      add :register_password, :string
      add :description, :text

      timestamps()
    end
  end
end

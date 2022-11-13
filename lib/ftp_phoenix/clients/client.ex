defmodule FtpPhoenix.Clients.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :description, :string
    field :name, :string
    field :register_code, :string
    field :register_password, :string
    field :server_password, :string
    field :server_url, :string
    field :server_user, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :server_url, :server_user, :server_password, :register_code, :register_password, :description])
    |> validate_required([:name, :server_url, :server_user, :server_password, :register_code, :register_password, :description])
  end
end

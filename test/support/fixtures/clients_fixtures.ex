defmodule FtpPhoenix.ClientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FtpPhoenix.Clients` context.
  """

  @doc """
  Generate a client.
  """
  def client_fixture(attrs \\ %{}) do
    {:ok, client} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        register_code: "some register_code",
        register_password: "some register_password",
        server_password: "some server_password",
        server_url: "some server_url",
        server_user: "some server_user"
      })
      |> FtpPhoenix.Clients.create_client()

    client
  end
end

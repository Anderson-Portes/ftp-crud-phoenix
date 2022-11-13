defmodule FtpPhoenix.ClientsTest do
  use FtpPhoenix.DataCase

  alias FtpPhoenix.Clients

  describe "clients" do
    alias FtpPhoenix.Clients.Client

    import FtpPhoenix.ClientsFixtures

    @invalid_attrs %{description: nil, name: nil, register_code: nil, register_password: nil, server_password: nil, server_url: nil, server_user: nil}

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Clients.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Clients.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      valid_attrs = %{description: "some description", name: "some name", register_code: "some register_code", register_password: "some register_password", server_password: "some server_password", server_url: "some server_url", server_user: "some server_user"}

      assert {:ok, %Client{} = client} = Clients.create_client(valid_attrs)
      assert client.description == "some description"
      assert client.name == "some name"
      assert client.register_code == "some register_code"
      assert client.register_password == "some register_password"
      assert client.server_password == "some server_password"
      assert client.server_url == "some server_url"
      assert client.server_user == "some server_user"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clients.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", register_code: "some updated register_code", register_password: "some updated register_password", server_password: "some updated server_password", server_url: "some updated server_url", server_user: "some updated server_user"}

      assert {:ok, %Client{} = client} = Clients.update_client(client, update_attrs)
      assert client.description == "some updated description"
      assert client.name == "some updated name"
      assert client.register_code == "some updated register_code"
      assert client.register_password == "some updated register_password"
      assert client.server_password == "some updated server_password"
      assert client.server_url == "some updated server_url"
      assert client.server_user == "some updated server_user"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Clients.update_client(client, @invalid_attrs)
      assert client == Clients.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Clients.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Clients.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Clients.change_client(client)
    end
  end
end

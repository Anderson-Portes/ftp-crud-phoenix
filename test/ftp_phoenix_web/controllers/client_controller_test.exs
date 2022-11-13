defmodule FtpPhoenixWeb.ClientControllerTest do
  use FtpPhoenixWeb.ConnCase

  import FtpPhoenix.ClientsFixtures

  @create_attrs %{description: "some description", name: "some name", register_code: "some register_code", register_password: "some register_password", server_password: "some server_password", server_url: "some server_url", server_user: "some server_user"}
  @update_attrs %{description: "some updated description", name: "some updated name", register_code: "some updated register_code", register_password: "some updated register_password", server_password: "some updated server_password", server_url: "some updated server_url", server_user: "some updated server_user"}
  @invalid_attrs %{description: nil, name: nil, register_code: nil, register_password: nil, server_password: nil, server_url: nil, server_user: nil}

  describe "index" do
    test "lists all clients", %{conn: conn} do
      conn = get(conn, Routes.client_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Clients"
    end
  end

  describe "new client" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.client_path(conn, :new))
      assert html_response(conn, 200) =~ "New Client"
    end
  end

  describe "create client" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.client_path(conn, :create), client: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.client_path(conn, :show, id)

      conn = get(conn, Routes.client_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Client"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.client_path(conn, :create), client: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Client"
    end
  end

  describe "edit client" do
    setup [:create_client]

    test "renders form for editing chosen client", %{conn: conn, client: client} do
      conn = get(conn, Routes.client_path(conn, :edit, client))
      assert html_response(conn, 200) =~ "Edit Client"
    end
  end

  describe "update client" do
    setup [:create_client]

    test "redirects when data is valid", %{conn: conn, client: client} do
      conn = put(conn, Routes.client_path(conn, :update, client), client: @update_attrs)
      assert redirected_to(conn) == Routes.client_path(conn, :show, client)

      conn = get(conn, Routes.client_path(conn, :show, client))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, client: client} do
      conn = put(conn, Routes.client_path(conn, :update, client), client: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Client"
    end
  end

  describe "delete client" do
    setup [:create_client]

    test "deletes chosen client", %{conn: conn, client: client} do
      conn = delete(conn, Routes.client_path(conn, :delete, client))
      assert redirected_to(conn) == Routes.client_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.client_path(conn, :show, client))
      end
    end
  end

  defp create_client(_) do
    client = client_fixture()
    %{client: client}
  end
end

defmodule FtpPhoenixWeb.PageController do
  use FtpPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

defmodule WebTestWeb.PageController do
  use WebTestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

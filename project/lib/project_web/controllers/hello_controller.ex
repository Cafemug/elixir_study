defmodule ProjectWeb.HelloController do
  use ProjectWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
  
  def show(conn, %{"messenger" => messenger}) do
    conn
    |> assign(:messenger, messenger)
    |> assign(:receiver, "Dweezil")
    |> render("show.html")
  end
end

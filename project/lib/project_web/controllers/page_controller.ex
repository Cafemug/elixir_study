defmodule ProjectWeb.PageController do
  use ProjectWeb, :controller

  def redirect_test(conn, _params) do
    redirect(conn, external: "https://elixir-lang.org/")
  end 
  
  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error.")
    |> render("index.html")
  end
end

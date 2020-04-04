defmodule TheTavernWeb.PageController do
  use TheTavernWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

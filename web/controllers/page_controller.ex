defmodule Testing.PageController do
  use Testing.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

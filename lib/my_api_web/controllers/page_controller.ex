defmodule MyApiWeb.PageController do
  use MyApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

defmodule Mongue.PageController do
  use Mongue.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

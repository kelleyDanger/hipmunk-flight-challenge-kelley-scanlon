defmodule HipmunkKelley.PageController do
  use HipmunkKelley.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

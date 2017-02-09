defmodule HipmunkKelley.PageControllerTest do
  use HipmunkKelley.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end

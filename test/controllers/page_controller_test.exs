defmodule HowToWatchTv.PageControllerTest do
  use HowToWatchTv.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "How To Watch TV"
  end
end

defmodule HowToWatchTv.PageControllerTest do
  use HowToWatchTv.ConnCase

  alias HowToWatchTv.Recommendation
  alias HowToWatchTv.Repo

  setup do
    changeset = Recommendation.changeset(
      %Recommendation{},
      %{name: "some content", tvdb_id: "some content"})
    Repo.insert!(changeset)
    {:ok, conn: build_conn}
  end

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "How To Watch TV"
  end
end

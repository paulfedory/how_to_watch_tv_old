defmodule HowToWatchTv.RecommendationControllerTest do
  use HowToWatchTv.ConnCase
  import Mock

  alias HowToWatchTv.Recommendation
  @valid_attrs %{name: "some content", tvdb_id: "some content"}
  @invalid_attrs %{}

  test "GET / without authorization header should throw 401", %{conn: conn} do
    conn = get conn, recommendation_path(conn, :index)
    assert response(conn, 401) == "unauthorized"
    assert get_resp_header(conn, "www-authenticate") == ["Basic realm=\"How To Watch TV Admin\""]
  end

  test "GET / with incorrect authorization should throw 401", %{conn: conn} do
    conn = conn
      |> put_req_header("authorization", "I like turtles")
      |> get(recommendation_path(conn, :index))
    assert response(conn, 401) == "unauthorized"
    assert get_resp_header(conn, "www-authenticate") == ["Basic realm=\"How To Watch TV Admin\""]
  end

  describe "successfully auth'd CRUD tests" do
    setup do
      {:ok, conn: put_req_header(build_conn, "authorization", "Basic dXNlcjpzZWNyZXQ=")}
    end

    test "lists all entries on index", %{conn: conn} do
      conn = get conn, recommendation_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing recommendations"
    end

    test "renders form for new resources", %{conn: conn} do
      conn = get conn, recommendation_path(conn, :new)
      assert html_response(conn, 200) =~ "New recommendation"
    end

    test "creates resource and redirects when data is valid", %{conn: conn} do
      with_mock HowToWatchTv.RecommendationParams, [fetch_tvdb_info: fn(_) -> @valid_attrs end] do
        conn = post conn, recommendation_path(conn, :create), recommendation: @valid_attrs
        assert redirected_to(conn) == recommendation_path(conn, :index)
        assert Repo.get_by(Recommendation, @valid_attrs)
      end
    end

    test "does not create resource and renders errors when data is invalid", %{conn: conn} do
      conn = post conn, recommendation_path(conn, :create), recommendation: @invalid_attrs
      assert html_response(conn, 200) =~ "New recommendation"
    end

    test "shows chosen resource", %{conn: conn} do
      recommendation = Repo.insert! %Recommendation{}
      conn = get conn, recommendation_path(conn, :show, recommendation)
      assert html_response(conn, 200) =~ "Show recommendation"
    end

    test "renders page not found when id is nonexistent", %{conn: conn} do
      assert_error_sent 404, fn ->
        get conn, recommendation_path(conn, :show, -1)
      end
    end

    test "renders form for editing chosen resource", %{conn: conn} do
      recommendation = Repo.insert! %Recommendation{}
      conn = get conn, recommendation_path(conn, :edit, recommendation)
      assert html_response(conn, 200) =~ "Edit recommendation"
    end

    test "updates chosen resource and redirects when data is valid", %{conn: conn} do
      recommendation = Repo.insert! %Recommendation{}
      conn = put conn, recommendation_path(conn, :update, recommendation), recommendation: @valid_attrs
      assert redirected_to(conn) == recommendation_path(conn, :show, recommendation)
      assert Repo.get_by(Recommendation, @valid_attrs)
    end

    test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
      recommendation = Repo.insert! %Recommendation{}
      conn = put conn, recommendation_path(conn, :update, recommendation), recommendation: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit recommendation"
    end

    test "deletes chosen resource", %{conn: conn} do
      recommendation = Repo.insert! %Recommendation{}
      conn = delete conn, recommendation_path(conn, :delete, recommendation)
      assert redirected_to(conn) == recommendation_path(conn, :index)
      refute Repo.get(Recommendation, recommendation.id)
    end
  end
end

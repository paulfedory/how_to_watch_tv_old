defmodule HowToWatchTv.PageController do
  use HowToWatchTv.Web, :controller

  alias HowToWatchTv.Recommendation

  def index(conn, _params) do
    query = from(r in Recommendation, order_by: [desc: r.updated_at])
    recommendations = Repo.all(query)
    render(conn, "index.html", recommendations: recommendations)
  end

  def image(conn, %{"id_ext" => id}) do
    recommendation = Repo.get!(Recommendation, elem(Integer.parse(id), 0))
    conn
    |> put_resp_content_type("image/jpeg", "utf-8")
    |> send_resp(200, recommendation.image_binary)
  end

  def thumbnail(conn, %{"id_ext" => id}) do
    recommendation = Repo.get!(Recommendation, elem(Integer.parse(id), 0))
    conn
    |> put_resp_content_type("image/jpeg", "utf-8")
    |> send_resp(200, recommendation.thumbnail_binary)
  end
end

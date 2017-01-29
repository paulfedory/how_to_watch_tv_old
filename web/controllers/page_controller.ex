defmodule HowToWatchTv.PageController do
  use HowToWatchTv.Web, :controller

  alias HowToWatchTv.Recommendation

  def index(conn, _params) do
    query = from(r in Recommendation, order_by: [desc: r.updated_at])
    recommendations = Repo.all(query)
    [most_recent | _] = recommendations
    last_updated = Recommendation.format_date(most_recent.updated_at)
    render(conn, "index.html",
      recommendations: recommendations,
      last_updated: last_updated,
    )
  end

  def image(conn, %{"id" => id}) do
    recommendation = Repo.get!(Recommendation, id)
    conn
    |> put_resp_content_type(recommendation.image_binary_type, "utf-8")
    |> send_resp(200, recommendation.image_binary)
  end

  def thumbnail(conn, %{"id" => id}) do
    recommendation = Repo.get!(Recommendation, id)
    conn
    |> put_resp_content_type(recommendation.thumbnail_binary_type, "utf-8")
    |> send_resp(200, recommendation.thumbnail_binary)
  end
end

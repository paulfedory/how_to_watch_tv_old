defmodule HowToWatchTv.PageController do
  use HowToWatchTv.Web, :controller

  alias HowToWatchTv.Recommendation

  def index(conn, _params) do
    query = from(r in Recommendation, order_by: [desc: r.updated_at])
    recommendations = Repo.all(query)
    render(conn, "index.html", recommendations: recommendations)
  end
end

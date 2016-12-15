defmodule HowToWatchTv.RecommendationController do
  use HowToWatchTv.Web, :controller

  alias HowToWatchTv.Recommendation

  def index(conn, _params) do
    recommendations = Repo.all(Recommendation)
    render(conn, "index.html", recommendations: recommendations)
  end

end

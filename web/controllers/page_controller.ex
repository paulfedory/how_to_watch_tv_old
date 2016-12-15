defmodule HowToWatchTv.PageController do
  use HowToWatchTv.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

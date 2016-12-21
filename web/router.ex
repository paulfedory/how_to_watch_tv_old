defmodule HowToWatchTv.Router do
  use HowToWatchTv.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin_layout do
    plug :put_layout, {HowToWatchTv.LayoutView, :admin}
    plug BasicAuth #, Application.fetch_env!(:how_to_watch_tv, BasicAuth)
  end

  scope "/", HowToWatchTv do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/admin", HowToWatchTv do
    pipe_through [:browser, :admin_layout]
    resources "/recommendations", RecommendationController
  end

  # Other scopes may use custom stacks.
  # scope "/api", HowToWatchTv do
  #   pipe_through :api
  # end
end

defmodule HowToWatchTv.ImageFetcher do
  use GenServer
  require Logger

  alias HowToWatchTv.Repo
  alias HowToWatchTv.Recommendation

  @name :image_fetcher

  # Client API

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [], opts ++ [name: @name])
  end

  def get_image(image_type, recommendation) do
    GenServer.cast(@name, {image_type, recommendation})
  end

  # Server implementation

  def init(_), do: {:ok, []}

  def handle_cast({:image, recommendation}, _state) do
    %HTTPoison.Response{body: image} = HTTPoison.get!(recommendation.image_url)
    Recommendation.changeset(recommendation, %{"image_binary" => image})
    |> Repo.update!
    {:noreply, []}
  end

  def handle_cast({:thumbnail, recommendation}, _state) do
    %HTTPoison.Response{body: image} = HTTPoison.get!(recommendation.thumbnail_url)
    Recommendation.changeset(recommendation, %{"thumbnail_binary" => image})
    |> Repo.update!
    {:noreply, []}
  end
end

defmodule Mix.Tasks.FetchImage do
  use Mix.Task
  import Mix.Ecto

  alias HowToWatchTv.Repo
  alias HowToWatchTv.Recommendation

  @shortdoc "Fetches a Recommendation image from TVDB and stores it in the DB record"

  def run(_args) do
    Mix.shell.info "Fetching images..."
    ensure_started(Repo, [])
    HTTPoison.start
    fetch_images
  end

  def fetch_images do
    Repo.all(Recommendation)
    |> Enum.each(&fetch_image/1)
  end

  def fetch_image(rec) do
    Mix.shell.info rec.name
    %HTTPoison.Response{body: image} = HTTPoison.get!(rec.image_url)
    %HTTPoison.Response{body: thumbnail} = HTTPoison.get!(rec.thumbnail_url)
    changeset = Recommendation.changeset(rec, %{"image_binary" => image, "thumbnail_binary" => thumbnail})
    Repo.update!(changeset)
  end
end

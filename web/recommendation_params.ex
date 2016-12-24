defmodule HowToWatchTv.RecommendationParams do

  def fetch_tvdb_info(params = %{"tvdb_id" => id}) do
    source_data = fetch_general_info(id)
    source_image = fetch_image_info(id)
    params
      |> Map.put("name", source_data["seriesName"])
      |> Map.put("description", source_data["overview"])
      |> Map.put("image_url", source_image["fileName"])
      |> Map.put("thumbnail_url", source_image["thumbnail"])
  end
  def fetch_tvdb_info(params), do: params

  defp fetch_general_info(id) do
    id
      |> ExTV.Series.by_id
      |> Map.get("data")
  end

  defp fetch_image_info(id) do
    id
      |> ExTV.Images.fanart
      |> List.first
  end
end

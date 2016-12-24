defmodule HowToWatchTv.RecommendationParamsTest do
  use ExUnit.Case

  import Mock
  alias HowToWatchTv.RecommendationParams

  @valid_attrs %{"name" => "some content", "tvdb_id" => "some content"}
  @successful_series_response %{
    "data" => %{
      "seriesName" => "new name",
      "overview" => "blah"
    }
  }

  @successful_images_response [
    %{"fileName" => "the file", "thumbnail" => "the thumb"},
    %{"fileName" => "the file", "thumbnail" => "the thumb"}
  ]

  test "fetch_tvdb_info/1 with no tvdb_id passes through params unchanged" do
    result = RecommendationParams.fetch_tvdb_info(%{a: 1})

    assert result == %{a: 1}
  end

  test "fetch_tvdb_info/1 with valid params updates the params" do
    with_mocks([
      {ExTV.Series, [], [by_id: fn(_id) -> @successful_series_response end]},
      {ExTV.Images, [], [fanart: fn(_id) -> @successful_images_response end]}
    ]) do
      result = RecommendationParams.fetch_tvdb_info(@valid_attrs)
      
      assert result["name"] == "new name"
      assert result["image_url"] == "the file"
      assert result["thumbnail_url"] == "the thumb"
      assert result["description"] == "blah"
    end
  end
end

defmodule HowToWatchTv.RecommendationTest do
  use HowToWatchTv.ModelCase

  alias HowToWatchTv.Recommendation

  @valid_attrs %{description: "some content", image_url: "some content", name: "some content", reason: "some content", source_data: %{}, thumbnail_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Recommendation.changeset(%Recommendation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Recommendation.changeset(%Recommendation{}, @invalid_attrs)
    refute changeset.valid?
  end
end

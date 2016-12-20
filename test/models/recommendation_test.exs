defmodule HowToWatchTv.RecommendationTest do
  use HowToWatchTv.ModelCase

  alias HowToWatchTv.Recommendation

  @valid_attrs %{name: "some content", tvdb_id: "some content"}
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

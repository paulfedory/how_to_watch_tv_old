defmodule HowToWatchTv.Repo.Migrations.AddBinaryTypesToRecommendations do
  use Ecto.Migration

  def change do
    alter table(:recommendations) do
      add :image_binary_type, :string, default: "image/jpeg"
      add :thumbnail_binary_type, :string, default: "image/jpeg"
    end
  end
end

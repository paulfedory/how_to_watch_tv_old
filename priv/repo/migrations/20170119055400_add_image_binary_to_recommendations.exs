defmodule HowToWatchTv.Repo.Migrations.AddImageBinaryToRecommendations do
  use Ecto.Migration

  def change do
    alter table(:recommendations) do
      add :image_binary, :binary
      remove :source_data
    end
  end
end

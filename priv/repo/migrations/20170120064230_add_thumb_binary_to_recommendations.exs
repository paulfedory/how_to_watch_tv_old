defmodule HowToWatchTv.Repo.Migrations.AddThumbBinaryToRecommendations do
  use Ecto.Migration

  def change do
    alter table(:recommendations) do
      add :thumbnail_binary, :binary
    end
  end
end

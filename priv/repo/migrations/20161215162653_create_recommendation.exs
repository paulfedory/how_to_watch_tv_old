defmodule HowToWatchTv.Repo.Migrations.CreateRecommendation do
  use Ecto.Migration

  def change do
    create table(:recommendations) do
      add :name, :string
      add :reason, :text
      add :description, :text
      add :image_url, :string
      add :thumbnail_url, :string
      add :tvdb_id, :string
      add :source_data, :map

      timestamps()
    end

  end
end

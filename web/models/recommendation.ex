defmodule HowToWatchTv.Recommendation do
  use HowToWatchTv.Web, :model

  schema "recommendations" do
    field :name, :string
    field :reason, :string
    field :description, :string
    field :image_url, :string
    field :thumbnail_url, :string
    field :source_data, :map

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :reason, :description, :image_url, :thumbnail_url, :source_data])
    |> validate_required([:name, :reason, :description, :image_url, :thumbnail_url, :source_data])
  end
end

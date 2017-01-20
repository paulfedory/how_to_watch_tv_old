defmodule HowToWatchTv.Recommendation do
  use HowToWatchTv.Web, :model

  schema "recommendations" do
    field :name, :string
    field :reason, :string
    field :description, :string
    field :image_url, :string
    field :thumbnail_url, :string
    field :tvdb_id, :string
    field :image_binary, :binary
    field :thumbnail_binary, :binary

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
        :name,
        :tvdb_id,
        :reason,
        :description,
        :image_url,
        :thumbnail_url,
        :image_binary,
        :thumbnail_binary
      ])
    |> validate_required([:name, :tvdb_id])
  end
end

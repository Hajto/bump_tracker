defmodule BumpTracker.Bumps.Bump do
  use Ecto.Schema
  import Ecto.Changeset
  alias BumpTracker.Bumps.Bump

  schema "bumps" do
    embeds_one :position, __MODULE__.Position
    field :date, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(%Bump{} = bump, attrs) do
    bump
    |> cast(attrs, [:date])
    |> cast_embed(:position)
    |> validate_required([:date])
  end

  defmodule Position do
    use Ecto.Schema
    embedded_schema do
      field :x, :float
      field :y, :float
    end

    @doc false
    def changeset(%Position{} = bump, attrs) do
      bump
      |> cast(attrs, [:x, :y])
      |> validate_required([:x, :y])
    end
  end
end

defmodule BumpTracker.Repo.Migrations.CreateBumps do
  use Ecto.Migration

  def change do
    create table(:bumps) do
      add :date, :naive_datetime
      add :position, :map

      timestamps()
    end

  end
end

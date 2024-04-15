defmodule SampleApp.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end

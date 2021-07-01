defmodule EctoRankedIssue16Example.Repo.Migrations.CreateExampleSchemas do
  use Ecto.Migration

  def change do
    create table(:example_schemas) do
      add :name, :string, null: false
      add :rank, :integer, null: false
      add :merchant_id, :bigint, null: false

      timestamps()
    end
  end
end

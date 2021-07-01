defmodule EctoRankedIssue16Example.Repo.Migrations.CreateMerchants do
  use Ecto.Migration

  def change do

    create table(:merchants, primary_key: false) do
      add :merchant_id, :bigserial, primary_key: true
      add :name, :string

      timestamps()
    end
  end
end

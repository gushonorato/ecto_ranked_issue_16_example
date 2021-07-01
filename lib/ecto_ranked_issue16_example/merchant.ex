defmodule EctoRankedIssue16Example.Merchant do
  use Ecto.Schema

  @primary_key {:merchant_id, :id, autogenerate: true}
  schema "merchants" do
    field(:id, :integer, source: :merchant_id)
    field(:name, :string)

    timestamps()
  end
end

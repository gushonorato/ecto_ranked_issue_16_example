defmodule EctoRankedIssue16Example.ExampleSchema do
  use Ecto.Schema

  import Ecto.Changeset
  import EctoRanked

  schema "example_schemas" do
    field(:name, :string)
    field(:rank, :integer)
    field(:position, :any, virtual: true)

    field(:merchant_id, :integer,
      autogenerate: {EctoRankedIssue16Example.Repo, :get_merchant_id, []}
    )

    belongs_to(:merchant, EctoRankedIssue16Example.Merchant,
      references: :merchant_id,
      define_field: false
    )

    timestamps()
  end

  def changeset(data, attrs) do
    data
    |> cast(attrs, [:name, :position])
    |> set_rank(scope: :merchant_id)
  end
end

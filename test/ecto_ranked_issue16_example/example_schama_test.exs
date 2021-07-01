defmodule EctoRankedIssue16Example.ExampleSchemaTest do
  use EctoRankedIssue16ExampleTest.DataCase

  alias EctoRankedIssue16Example.{Repo, ExampleSchema, Merchant}

  test "greets the world" do
    merchant = Repo.insert!(%Merchant{name: "a merchant"})

    Repo.put_merchant_id(merchant.merchant_id)

    result =
      %ExampleSchema{}
      |> ExampleSchema.changeset(%{name: "an example schema"})
      |> Repo.insert!()

    assert result.rank == 0

    result =
      %ExampleSchema{}
      |> ExampleSchema.changeset(%{name: "another example schema"})
      |> Repo.insert!()

    refute result.rank == 0
  end
end

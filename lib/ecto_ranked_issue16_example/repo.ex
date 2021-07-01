defmodule EctoRankedIssue16Example.Repo do
  use Ecto.Repo,
    otp_app: :ecto_ranked_issue_16_example,
    adapter: Ecto.Adapters.Postgres

  require Ecto.Query

  @tenant_key {__MODULE__, :merchant_id}

  def put_merchant_id(merchant_id) do
    Process.put(@tenant_key, merchant_id)
  end

  def get_merchant_id() do
    Process.get(@tenant_key)
  end

  @impl true
  def default_options(_operation) do
    [merchant_id: get_merchant_id()]
  end

  @impl true
  def prepare_query(_operation, query, opts) do
    cond do
      opts[:skip_merchant_id] || opts[:schema_migration] || private_tablespace?(opts) ->
        {query, opts}

      merchant_id = opts[:merchant_id] ->
        {Ecto.Query.where(query, merchant_id: ^merchant_id), opts}

      true ->
        raise "expected merchant_id or skip_merchant_id to be set"
    end
  end

  defp private_tablespace?(opts), do: opts[:prefix] == "private"
end

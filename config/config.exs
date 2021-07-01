import Config

config :ecto_ranked_issue_16_example, EctoRankedIssue16Example.Repo,
  database: "ecto_ranked_issue_16_example_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :ecto_ranked_issue_16_example,
  ecto_repos: [EctoRankedIssue16Example.Repo]

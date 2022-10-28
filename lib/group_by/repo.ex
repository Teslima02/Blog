defmodule GroupBy.Repo do
  use Ecto.Repo,
    otp_app: :group_by,
    adapter: Ecto.Adapters.Postgres
end

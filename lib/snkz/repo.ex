defmodule Snkz.Repo do
  use Ecto.Repo,
    otp_app: :snkz,
    adapter: Ecto.Adapters.Postgres
end

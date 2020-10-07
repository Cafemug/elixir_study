defmodule WebTest.Repo do
  use Ecto.Repo,
    otp_app: :web_test,
    adapter: Ecto.Adapters.MyXQL
end

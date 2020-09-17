# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phx_chat,
  ecto_repos: [PhxChat.Repo]

# Configures the endpoint
config :phx_chat, PhxChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0/i3yshg1IIwZwD4ohyPaqVAgX49ERbucHmjd/fE89+nLpybjbEdtPdIfbXklR+4",
  render_errors: [view: PhxChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhxChat.PubSub,
  live_view: [signing_salt: "v3UGsS0+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

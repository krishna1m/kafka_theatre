defmodule MyClient do
  use Avrora.Client,
    otp_app: :kafka_theatre,
    schemas_path: "./priv/schemas",
    registry_url: "http://localhost:8081",
    registry_auth: {:basic, ["username", "password"]},
    registry_user_agent: "Avrora/0.25.0 Elixir",
    registry_schemas_autoreg: true,
    convert_null_values: false,
    convert_map_to_proplist: false,
    names_cache_ttl: :timer.minutes(5)
end

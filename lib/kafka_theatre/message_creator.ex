defmodule KafkaTheatre.MessageCreator do
  alias MyClient

  def create_message(amount) do
    {:ok, encoded} =
      File.read!("dummy_payment.json")
      |> Jason.decode!()
      |> Map.put("amount", amount)
      |> Map.put("id", Integer.to_string(amount))
      |> MyClient.encode(schema_name: "io.confluent.Payment")
    encoded
  end
end

defmodule TestItOut do
  def test do
    topic = "input"
    client_id = :my_client
    hosts = [localhost: 29092]
    :ok = :brod.start_client(hosts, client_id, _client_config=[])
    :ok = :brod.start_producer(client_id, topic, _producer_config = [])

    buffer_size = 100
    Enum.each(1..buffer_size, fn amount ->
      msg = KafkaTheatre.MessageCreator.create_message(amount)
      :ok = :brod.produce_sync(client_id, topic, 0, _key="", msg)
    end)

    IO.inspect("Published #{buffer_size} messages")
  end
end

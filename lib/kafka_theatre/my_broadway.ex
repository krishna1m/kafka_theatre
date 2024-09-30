defmodule MyBroadway do
  use Broadway

  alias Broadway.Message
  alias MyClient

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module:
          {BroadwayKafka.Producer,
           [
             hosts: [localhost: 29092],
             group_id: "group_1",
             topics: ["test"]
           ]},
        concurrency: 1
      ],
      processors: [
        default: [
          concurrency: 10
        ]
      ],
      batchers: [
        default: [
          batch_size: 100,
          batch_timeout: 200,
          concurrency: 10
        ]
      ]
    )
  end

  @impl true
  def handle_message(_, message, _) do
    message
    |> Message.update_data(&decode/1)
  end

  @impl true
  def handle_batch(_, messages, _, _) do
    list = messages |> Enum.map(fn e -> e.data end)
    total_amount =
      list
      |> Enum.sum()
    IO.inspect(list, label: "Got batch sum: #{total_amount}")
    messages
  end

  defp decode(data) do
    {:ok, decoded} = MyClient.decode(data)
    decoded["amount"]
  end
end

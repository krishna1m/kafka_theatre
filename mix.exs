defmodule KafkaTheatre.MixProject do
  use Mix.Project

  def project do
    [
      app: :kafka_theatre,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {KafkaTheatre.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:avrora, "~> 0.27"},
      {:broadway_kafka, "~> 0.3"}
    ]
  end
end

defmodule KafkaTheatreTest do
  use ExUnit.Case
  doctest KafkaTheatre

  test "greets the world" do
    assert KafkaTheatre.hello() == :world
  end
end

# KafkaTheatre
[Demo link](https://drive.google.com/file/d/1zzBRqYoW9-_l55pJ921wqC5GX5EIjWbX/view?usp=sharing)
## Launch
```bash
docker stop $(docker ps -aq) && docker rm -v $(docker ps -aq)
docker-compose up -d
iex -S mix
```
Wait for this message to arrive
```
19:40:16.446 [info] client MyBroadway.Broadway.Producer_0.Client connected to localhost:29092
```
Once there, in the iex session, do
```elixir
TestItOut.test
```
## What it does?
```
Kills all running docker containers.
Tries to start pods that are required(zookeeper, kafka, schemaregistry).
The Application creates a topic `input` automatically.
When `iex` comes up, a consumer starts listening to the topic.
We use `TestItOut.test` to publish some messages which are consumed and processed by the consumer.
```

/// Mqtt handler used to handle message from topic.
abstract class MqttHandler {
  void handleMqtt(String topic, dynamic payload);
}

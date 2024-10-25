part of 'mqtt_bloc.dart';

@freezed
class MqttEvent with _$MqttEvent {
  const factory MqttEvent.pause() = _Pause;
  const factory MqttEvent.clientConnected() = _ClientConnected;
  const factory MqttEvent.clientDisconnected() = _ClientDisconnected;
}

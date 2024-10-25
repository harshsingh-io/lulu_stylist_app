part of 'mqtt_bloc.dart';

@freezed
class MqttState with _$MqttState {
  const factory MqttState.connecting() = _Connecting;
  const factory MqttState.connected() = _Connected;
  const factory MqttState.disconnected() = _Disconnected;
  const factory MqttState.reconnecting() = _Reconnecting;
}

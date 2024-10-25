part of 'network_bloc.dart';

@freezed
class NetworkEvent with _$NetworkEvent {
  const factory NetworkEvent.observer() = _Observer;
  const factory NetworkEvent.notify({required bool isConnected}) = _Notify;
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_add_device.freezed.dart';
part 'user_add_device.g.dart';

@freezed
class UserAddDevice with _$UserAddDevice {
  const factory UserAddDevice({
    required String deviceToken,
    required String platform,
  }) = _UserAddDevice;

  factory UserAddDevice.fromJson(Map<String, Object?> json) =>
      _$UserAddDeviceFromJson(json);
}

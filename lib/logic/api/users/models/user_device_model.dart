import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_device_model.freezed.dart';
part 'user_device_model.g.dart';

@freezed
class UserDeviceModel with _$UserDeviceModel {
  const factory UserDeviceModel({
    required String id,
    required String deviceToken,
    required String platform,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserDeviceModel;

  /// Connect the generated [_$UserDeviceModelFromJson] function to the `fromJson`
  /// factory.
  factory UserDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceModelFromJson(json);
}

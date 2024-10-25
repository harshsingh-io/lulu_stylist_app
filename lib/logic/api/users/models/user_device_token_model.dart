import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_device_token_model.freezed.dart';
part 'user_device_token_model.g.dart';

@freezed
class UserDeviceTokenModel with _$UserDeviceTokenModel {
  const factory UserDeviceTokenModel({
    required String deviceToken,
  }) = _UserDeviceTokenModel;

  /// Connect the generated [_$UserDeviceTokenModelFromJson] function to the `fromJson`
  /// factory.
  factory UserDeviceTokenModel.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceTokenModelFromJson(json);
}

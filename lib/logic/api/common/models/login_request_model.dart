import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_model.freezed.dart';
part 'login_request_model.g.dart';

@freezed
class LoginRequestModel with _$LoginRequestModel {
  const factory LoginRequestModel({
    required String phone,
    required String otp,
  }) = _LoginRequestModel;

  /// Connect the generated [_$LoginRequestModelFromJson] function to the `fromJson`
  /// factory.
  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
}
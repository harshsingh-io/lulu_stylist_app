import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_model.freezed.dart';
part 'user_register_model.g.dart';

@freezed
class UserRegisterModel with _$UserRegisterModel {
  const factory UserRegisterModel({
    required String email,
    required String username,
    required String password,
  }) = _UserRegisterModel;

  /// Connect the generated [_$UserRegisterModelFromJson] function to the `fromJson`
  /// factory.
  factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterModelFromJson(json);
}

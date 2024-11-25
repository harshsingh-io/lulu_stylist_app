import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String email,
    required String username,
    required String? publicUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? firstName,
    String? lastName,
    @Default(false) bool isActive,
  }) = _UserModel;

  /// Connect the generated [_$UserModelFromJson] function to the `fromJson`
  /// factory.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  const UserModel._();
  bool isProfileComplete() {
    return firstName != null;
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String? phone,
    required String? fullName,
    required String? imageBlurhash,
    required bool isActive,
    required String? publicUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserModel;

  /// Connect the generated [_$UserModelFromJson] function to the `fromJson`
  /// factory.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  const UserModel._();
  bool isProfileComplete() {
    return fullName != null;
  }
}

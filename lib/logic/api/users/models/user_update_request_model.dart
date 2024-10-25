import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_update_request_model.freezed.dart';
part 'user_update_request_model.g.dart';

@freezed
class UserUpdateRequestModel with _$UserUpdateRequestModel {
  const factory UserUpdateRequestModel({
    required String fullName,
    String? path,
  }) = _UserUpdateRequestModel;


  /// Connect the generated [_$ExpertUpdateRequestModelFromJson] function to the `fromJson`
  /// factory.
  factory UserUpdateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateRequestModelFromJson(json);
}

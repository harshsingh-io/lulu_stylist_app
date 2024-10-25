import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';

part 'loggedin_user_model.freezed.dart';
part 'loggedin_user_model.g.dart';

@freezed
class LoggedInUserModel with _$LoggedInUserModel {
  const factory LoggedInUserModel({
    required String accessToken,
    required UserModel user,
  }) = _LoggedInUserModel;

  /// Connect the generated [_$LoggedInUserModelFromJson] function to the `fromJson`
  /// factory.
  factory LoggedInUserModel.fromJson(Map<String, dynamic> json) =>
      _$LoggedInUserModelFromJson(json);
}

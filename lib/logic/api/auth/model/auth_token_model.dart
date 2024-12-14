import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token_model.g.dart';
part 'auth_token_model.freezed.dart';

@freezed
class AuthTokenModel with _$AuthTokenModel {
  const factory AuthTokenModel({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'token_type') required String tokenType,
  }) = _AuthTokenModel;

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenModelFromJson(json);
}

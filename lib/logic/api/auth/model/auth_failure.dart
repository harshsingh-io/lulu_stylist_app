import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.serverError([String? message]) = ServerError;
  const factory AuthFailure.networkError() = NetworkError;
  const factory AuthFailure.invalidCredentials() = InvalidCredentials;
  const factory AuthFailure.tokenExpired() = TokenExpired;
}

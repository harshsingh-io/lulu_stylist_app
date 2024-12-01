part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.inProgress() = _InProgress;

  const factory LoginState.loginStarted({
    required UserType userType,
    required String email,
    required int attempts,
  }) = _LoginStarted;

  const factory LoginState.loginUserSuccess({
    required String authToken,
    required String refreshToken,
    required UserModel user,
    required UserType userType,
  }) = _LoginUserSuccess;

  const factory LoginState.error(String message) = _LoginError;
}

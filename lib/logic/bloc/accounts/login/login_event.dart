part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.startLogin({
    required UserType userType,
    required String phone,
    required int attempts,
  }) = _StartLogin;

  const factory LoginEvent.verifyLogin({
    required UserType userType,
    required String phone,
    required String otp,
    required int attempts,
  }) = _VerifyLogin;
}

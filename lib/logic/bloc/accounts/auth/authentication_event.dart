// lib/logic/bloc/accounts/auth/authentication_event.dart
part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.checkExisting() = _CheckExisting;

  const factory AuthenticationEvent.newUserLogin({
    required String authToken,
    required UserModel user,
  }) = _NewUserLogin;

  const factory AuthenticationEvent.completeProfile({
    required UserModel user,
    required String authToken,
  }) = _CompleteProfile;

  const factory AuthenticationEvent.authenticatUser({
    required UserModel user,
    required String authToken,
  }) = _AuthenticateUser;

  const factory AuthenticationEvent.logoutRequested() = _LogoutRequested;

  const factory AuthenticationEvent.sessionExpired() = _SessionExpired;
}

// lib/logic/bloc/accounts/auth/authentication_state.dart
part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = _Initial;

  const factory AuthenticationState.checking() = _Checking;

  const factory AuthenticationState.unAuthenticated() = _UnAuthenticated;

  const factory AuthenticationState.userNeedsProfileDetails({
    required UserModel user,
    required String authToken,
  }) = _UserNeedsProfileDetails;

  const factory AuthenticationState.userLoggedIn({
    required UserModel user,
    required String authToken,
  }) = _UserLoggedIn;

  const factory AuthenticationState.userAuthenticated({
    required UserModel user,
    required String authToken,
  }) = _UserAuthenticated;

  const factory AuthenticationState.loggedOut() = _LoggedOut;

  const factory AuthenticationState.error(String message) = _Error;
}

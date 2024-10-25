part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.checkExisting() = CheckExisting;
  const factory AuthenticationEvent.signInWithEmail({
    required String email,
    required String password,
  }) = SignInWithEmail;
  const factory AuthenticationEvent.registerWithEmail({
    required String email,
    required String password,
  }) = RegisterWithEmail;
  const factory AuthenticationEvent.logout() = Logout;
}

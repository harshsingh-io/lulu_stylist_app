part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = Initial;
  const factory AuthenticationState.loading() = Loading;
  const factory AuthenticationState.authenticated({
    required User user,
    required Map<String, dynamic>? userData,
  }) = Authenticated;
  const factory AuthenticationState.needsProfileCompletion({
    required User user,
  }) = NeedsProfileCompletion;

  const factory AuthenticationState.unauthenticated() = Unauthenticated;
  const factory AuthenticationState.error({required String message}) =
      ErrorState;
}

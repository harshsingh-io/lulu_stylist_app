part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState.initial() = _Initial;
  factory AuthenticationState.checking() = _Checking;
  factory AuthenticationState.inProgress({
    required UserType userType,
    required String phone,
    required int attempt,
  }) = _InProgess;
  factory AuthenticationState.userAuthenticated({
    required UserModel user,
    required String authToken,
  }) = _UserAuthenticated;

  factory AuthenticationState.unAuthenticated() = _UnAuthenticated;
  factory AuthenticationState.loggedOut() = _LoggedOut;

  factory AuthenticationState.userLoggedIn({
    required UserModel user,
    required String authToken,
  }) = _UserLoggedIn;
  factory AuthenticationState.userNeedsProfileDetails({
    required UserModel userModel,
    required String authToken,
  }) = _UserNeedsProfileDetails;
  factory AuthenticationState.userNeedsOnboard() = _UserNeedsOnboard;
}

extension AuthenticationStateX on AuthenticationState {
  bool get isAuthenticated =>
      this is _UserAuthenticated || this is _UserLoggedIn;
  bool get isAuthUser => this is _UserAuthenticated || this is _UserLoggedIn;
  UserModel? get authUser => maybeWhen(
        userAuthenticated: (user, authToken) => user,
        userLoggedIn: (user, authToken) => user,
        orElse: () => null,
      );
}

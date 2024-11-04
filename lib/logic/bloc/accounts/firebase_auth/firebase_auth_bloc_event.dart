part of 'firebase_auth_bloc_bloc.dart';

@freezed
class FirebaseAuthBlocEvent with _$FirebaseAuthBlocEvent {
  const factory FirebaseAuthBlocEvent.started() = AuthenticationStarted;
  const factory FirebaseAuthBlocEvent.loggedIn() = AuthenticationLoggedIn;
  const factory FirebaseAuthBlocEvent.loggedOut() = AuthenticationLoggedOut;
  const factory FirebaseAuthBlocEvent.authStateChanged(User? user) =
      AuthenticationStateChanged;
}

part of 'firebase_auth_bloc_bloc.dart';

@freezed
class FirebaseAuthBlocState with _$FirebaseAuthBlocState {
  const factory FirebaseAuthBlocState.initial() = FirebaseAuthInitial;
  const factory FirebaseAuthBlocState.authenticated(User user) =
      FirebaseAuthAuthenticated;
  const factory FirebaseAuthBlocState.unauthenticated() =
      FirebaseAuthUnauthenticated;
}

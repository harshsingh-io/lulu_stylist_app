import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/firebase_auth/firebase_auth_repository.dart';

part 'firebase_auth_bloc_event.dart';
part 'firebase_auth_bloc_state.dart';
part 'bloc/firebase_auth_bloc_bloc.freezed.dart';

class FirebaseAuthBlocBloc
    extends Bloc<FirebaseAuthBlocEvent, FirebaseAuthBlocState> {
  FirebaseAuthBlocBloc(this._authRepository)
      : super(const FirebaseAuthBlocState.initial()) {
    // Listen to the stream of authentication state changes
    _authRepository.authStateChanges.listen((User? user) {
      add(FirebaseAuthBlocEvent.authStateChanged(user));
    });

    on<FirebaseAuthBlocEvent>((event, emit) => event.map(
          started: (e) => _started(e, emit),
          loggedIn: (e) => _loggedIn(e, emit),
          loggedOut: (e) => _loggedOut(e, emit),
          authStateChanged: (e) => _authStateChanged(e, emit),
        ));
  }
  final FirebaseAuthRepository _authRepository;

  void _started(
      AuthenticationStarted event, Emitter<FirebaseAuthBlocState> emit) {
    // Optional: Initialize anything you need at bloc start
  }

  void _loggedIn(
      AuthenticationLoggedIn event, Emitter<FirebaseAuthBlocState> emit) {
    // This may not be needed if Firebase auth triggers automatically handle it
  }

  void _loggedOut(
      AuthenticationLoggedOut event, Emitter<FirebaseAuthBlocState> emit) {
    _authRepository.signOut();
  }

  void _authStateChanged(
      FirebaseAuthBlocStateChanged event, Emitter<FirebaseAuthBlocState> emit) {
    if (event.user != null) {
      emit(FirebaseAuthBlocState.authenticated(event.user!));
    } else {
      emit(const FirebaseAuthBlocState.unauthenticated());
    }
  }
}

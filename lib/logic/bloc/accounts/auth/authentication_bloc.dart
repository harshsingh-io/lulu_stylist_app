// lib/blocs/authentication/authentication_bloc.dart

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/auth_repository.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_event.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authRepository;
  late final StreamSubscription<User?> _authSubscription;

  AuthenticationBloc({required AuthenticationRepository authRepository})
      : _authRepository = authRepository,
        super(Unauthenticated()) {
    // Listen to auth state changes
    _authSubscription = _authRepository.user.listen((user) {
      if (user != null) {
        add(UserChanged(user: user));
      } else {
        add(UserLoggedOut());
      }
    });

    // Event handlers
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<Registered>(_onRegistered);
    on<LoggedOut>(_onLoggedOut);
    on<UserChanged>(_onUserChanged);
    on<UserLoggedOut>(_onUserLoggedOut);
  }

  // Dispose method to cancel the subscription
  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }

  Future<void> _onAppStarted(
      AppStarted event, Emitter<AuthenticationState> emit) async {
    final user = _authRepository.currentUser;
    if (user != null) {
      emit(Authenticated(user: user));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onLoggedIn(
      LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(Authenticating());
    try {
      final userCredential = await _authRepository.logIn(
        email: event.email,
        password: event.password,
      );
      emit(Authenticated(user: userCredential.user!));
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationFailure(
          message: _mapFirebaseAuthExceptionToMessage(e)));
    } catch (e) {
      emit(AuthenticationFailure(message: 'An unknown error occurred.'));
    }
  }

  Future<void> _onRegistered(
      Registered event, Emitter<AuthenticationState> emit) async {
    emit(Authenticating());
    try {
      final userCredential = await _authRepository.signUp(
        email: event.email,
        password: event.password,
      );
      emit(Authenticated(user: userCredential.user!));
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationFailure(
          message: _mapFirebaseAuthExceptionToMessage(e)));
    } catch (e) {
      emit(AuthenticationFailure(message: 'An unknown error occurred.'));
    }
  }

  Future<void> _onLoggedOut(
      LoggedOut event, Emitter<AuthenticationState> emit) async {
    await _authRepository.logOut();
    emit(Unauthenticated());
  }

  Future<void> _onUserChanged(
      UserChanged event, Emitter<AuthenticationState> emit) async {
    emit(Authenticated(user: event.user));
  }

  Future<void> _onUserLoggedOut(
      UserLoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(Unauthenticated());
  }

  String _mapFirebaseAuthExceptionToMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'operation-not-allowed':
        return 'Operation not allowed. Please contact support.';
      case 'weak-password':
        return 'The password is too weak.';
      default:
        return 'An undefined error occurred.';
    }
  }
}

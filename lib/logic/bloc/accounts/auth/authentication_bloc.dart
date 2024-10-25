import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';

import 'auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._authRepository)
      : super(AuthenticationState.initial()) {
    on<CheckExisting>(_checkExisting);
    on<SignInWithEmail>(_signInWithEmail);
    on<RegisterWithEmail>(_registerWithEmail);
    on<Logout>(_logout);
  }

  final AuthRepository _authRepository;

  Future<void> _checkExisting(
    CheckExisting event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationState.loading());
    final user = await _authRepository.getCurrentUser();
    if (user != null) {
      final userData = await _authRepository.getUserData(user.uid);
      if (userData != null &&
          userData['name'] != null &&
          userData['name'].isNotEmpty) {
        // Profile is complete
        emit(AuthenticationState.authenticated(user: user, userData: userData));
      } else {
        // Profile is incomplete
        emit(AuthenticationState.needsProfileCompletion(user: user));
      }
    } else {
      emit(AuthenticationState.unauthenticated());
    }
  }

  Future<void> _signInWithEmail(
    SignInWithEmail event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationState.loading());
    try {
      final user = await _authRepository.signInWithEmailAndPassword(
        event.email,
        event.password,
      );
      final userData = await _authRepository.getUserData(user!.uid);

      if (userData != null &&
          userData['name'] != null &&
          userData['name'].isNotEmpty) {
        // Profile is complete
        emit(AuthenticationState.authenticated(user: user, userData: userData));
      } else {
        // Profile is incomplete
        emit(AuthenticationState.needsProfileCompletion(user: user));
      }

      // Register device token
      await _authRepository.registerDeviceToken();
    } catch (e) {
      emit(AuthenticationState.error(message: e.toString()));
    }
  }

  Future<void> _registerWithEmail(
    RegisterWithEmail event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationState.loading());
    try {
      final user = await _authRepository.registerWithEmailAndPassword(
        event.email,
        event.password,
      );
      final userData = await _authRepository.getUserData(user!.uid);

      // Since the user just registered, their profile is likely incomplete
      emit(AuthenticationState.needsProfileCompletion(user: user));

      // Register device token
      await _authRepository.registerDeviceToken();
    } catch (e) {
      emit(AuthenticationState.error(message: e.toString()));
    }
  }

  Future<void> _logout(
    Logout event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _authRepository.logout();
    emit(AuthenticationState.unauthenticated());
  }
}

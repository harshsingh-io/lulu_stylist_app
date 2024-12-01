// lib/logic/bloc/accounts/auth/authentication_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/auth/model/auth_failure.dart';
import 'package:lulu_stylist_app/logic/api/auth/model/token_pair.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_update_request_model.dart';
import 'package:lulu_stylist_app/logic/api_base.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/auth_repository.dart';
import 'package:lulu_stylist_app/logic/dio_factory.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

Logger log = Logger(printer: PrettyPrinter());

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : _authRepository = AuthRepository(
          baseUrl: apiBase,
          dioClient: DioFactory().create(),
        ),
        super(const AuthenticationState.initial()) {
    on<_CheckExisting>(_checkExisting);
    on<_NewUserLogin>(_handleNewUserLogin);
    on<_CompleteProfile>(_handleCompleteProfile);
    on<_AuthenticateUser>(_handleUserAuthenticated);
    on<_LogoutRequested>(_handleLogout);
    on<_SessionExpired>(_handleSessionExpired);
    on<_Register>(_handleRegister);
    on<_Login>(_handleLogin);
  }

  final AuthRepository _authRepository;
  final String _logTag = 'AuthenticationBloc';

  Future<void> _checkExisting(
    _CheckExisting event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(const AuthenticationState.checking());

      final tokenResult = await _authRepository.getStoredTokens();
      tokenResult.fold(
        (failure) => emit(const AuthenticationState.unAuthenticated()),
        (tokens) async {
          try {
            final userResult = await _authRepository.getCurrentUser();
            await userResult.fold(
              (failure) async {
                if (failure is TokenExpired) {
                  final refreshResult = await _authRepository.refreshTokens(
                    tokens.refreshToken,
                  );
                  await refreshResult.fold(
                    (failure) {
                      log.w(
                        '$_logTag Token refresh failed',
                        error: failure,
                      );
                      emit(const AuthenticationState.unAuthenticated());
                    },
                    (newTokens) async {
                      final newUserResult =
                          await _authRepository.getCurrentUser();
                      newUserResult.fold(
                        (failure) {
                          log.e(
                            '$_logTag Get user failed after token refresh',
                            error: failure,
                          );
                          emit(const AuthenticationState.unAuthenticated());
                        },
                        (user) {
                          if (user.userDetails == null) {
                            emit(
                              AuthenticationState.userNeedsProfileDetails(
                                user: user,
                                authToken: newTokens.accessToken,
                              ),
                            );
                          } else {
                            emit(
                              AuthenticationState.userLoggedIn(
                                user: user,
                                authToken: newTokens.accessToken,
                              ),
                            );
                          }
                        },
                      );
                    },
                  );
                } else {
                  emit(const AuthenticationState.unAuthenticated());
                }
              },
              (user) {
                if (user.userDetails == null) {
                  emit(
                    AuthenticationState.userNeedsProfileDetails(
                      user: user,
                      authToken: tokens.accessToken,
                    ),
                  );
                } else {
                  emit(
                    AuthenticationState.userLoggedIn(
                      user: user,
                      authToken: tokens.accessToken,
                    ),
                  );
                }
              },
            );
          } catch (e, stackTrace) {
            log.e(
              '$_logTag Check auth status failed',
              error: e,
              stackTrace: stackTrace,
            );
            emit(const AuthenticationState.unAuthenticated());
          }
        },
      );
    } catch (e, stackTrace) {
      log.e(
        '$_logTag Check existing failed',
        error: e,
        stackTrace: stackTrace,
      );
      emit(const AuthenticationState.unAuthenticated());
    }
  }

  Future<void> _handleNewUserLogin(
    _NewUserLogin event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(const AuthenticationState.checking());

      await _authRepository.saveTokens(
        TokenPair(
          accessToken: event.authToken,
          refreshToken: event.authToken,
          tokenType: 'bearer',
        ),
      );

      if (event.user.userDetails == null) {
        emit(
          AuthenticationState.userNeedsProfileDetails(
            user: event.user,
            authToken: event.authToken,
          ),
        );
      } else {
        emit(
          AuthenticationState.userLoggedIn(
            user: event.user,
            authToken: event.authToken,
          ),
        );
      }
    } catch (e, stackTrace) {
      log.e(
        '$_logTag New user login failed',
        error: e,
        stackTrace: stackTrace,
      );
      emit(AuthenticationState.error(e.toString()));
    }
  }

  Future<void> _handleCompleteProfile(
    _CompleteProfile event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(
      AuthenticationState.userLoggedIn(
        user: event.user,
        authToken: event.authToken,
      ),
    );
  }

  Future<void> _handleUserAuthenticated(
    _AuthenticateUser event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(
      AuthenticationState.userAuthenticated(
        user: event.user,
        authToken: event.authToken,
      ),
    );
  }

  Future<void> _handleLogout(
    _LogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(const AuthenticationState.checking());

      final result = await _authRepository.logout();
      result.fold(
        (failure) {
          log.e('$_logTag Logout failed', error: failure);
          emit(const AuthenticationState.loggedOut());
        },
        (_) => emit(const AuthenticationState.loggedOut()),
      );
    } catch (e, stackTrace) {
      log.e(
        '$_logTag Logout failed',
        error: e,
        stackTrace: stackTrace,
      );
      // Still emit logged out even on error
      emit(const AuthenticationState.loggedOut());
    }
  }

  Future<void> _handleSessionExpired(
    _SessionExpired event,
    Emitter<AuthenticationState> emit,
  ) async {
    log.w('$_logTag Session expired');
    await _authRepository.clearTokens();
    emit(const AuthenticationState.unAuthenticated());
  }

  Future<void> _handleRegister(
    _Register event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(const AuthenticationState.checking());

      final result = await _authRepository.register(
        email: event.email,
        username: event.username,
        password: event.password,
      );

      result.fold(
        (failure) {
          log.e('$_logTag Registration failed', error: failure);
          emit(AuthenticationState.error(failure.toString()));
        },
        (user) {
          emit(
            AuthenticationState.userNeedsProfileDetails(
              user: user,
              authToken: '',
            ),
          );
        },
      );
    } catch (e, stackTrace) {
      log.e(
        '$_logTag Registration failed',
        error: e,
        stackTrace: stackTrace,
      );
      emit(AuthenticationState.error(e.toString()));
    }
  }

  Future<void> _handleLogin(
    _Login event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(const AuthenticationState.checking());

      final loginResult = await _authRepository.login(
        email: event.email,
        password: event.password,
      );

      await loginResult.fold(
        (failure) {
          final errorMessage = failure.when(
            tokenExpired: () => 'Session expired',
            serverError: (message) => message ?? 'Login failed',
            networkError: () => 'Network error',
            invalidCredentials: () => 'Invalid credentials',
          );
          emit(AuthenticationState.error(errorMessage));
        },
        (tokens) async {
          final userResult = await _authRepository.getCurrentUser();
          userResult.fold(
            (failure) => emit(
                const AuthenticationState.error("Failed to get user details")),
            (user) => emit(AuthenticationState.userLoggedIn(
              user: user,
              authToken: tokens.accessToken,
            )),
          );
        },
      );
    } catch (e) {
      emit(const AuthenticationState.error("An unexpected error occurred"));
    }
  }
}

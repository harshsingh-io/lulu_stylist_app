import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/auth/model/auth_failure.dart';
import 'package:lulu_stylist_app/logic/api/auth/model/auth_token_model.dart';
import 'package:lulu_stylist_app/logic/api/auth/model/token_pair.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:lulu_stylist_app/logic/api_base.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/auth_repository.dart';
import 'package:lulu_stylist_app/logic/bloc/user/user_repository.dart';
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
        _userRepository = UserRepository(baseUrl: apiBase),
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
  final UserRepository _userRepository;
  final String _logTag = 'AuthenticationBloc';

  Future<void> _checkExisting(
    _CheckExisting event,
    Emitter<AuthenticationState> emit,
  ) async {
    log.d('$_logTag _checkExisting called');
    try {
      emit(const AuthenticationState.checking());

      final tokenResult = await _authRepository.getStoredTokens();
      await tokenResult.fold(
        (failure) {
          log.w('$_logTag Token retrieval failed', error: failure);
          emit(const AuthenticationState.unAuthenticated());
        },
        (tokens) async {
          log.d('$_logTag Tokens retrieved successfully');
          try {
            final userResult =
                await _userRepository.getCurrentUser(tokens.accessToken);
            await userResult.fold(
              (failure) async {
                if (failure is TokenExpired) {
                  log.w('$_logTag Token expired, attempting refresh');
                  final refreshResult = await _authRepository.refreshTokens(
                    tokens.refreshToken,
                  );
                  await refreshResult.fold(
                    (failure) {
                      log.e('$_logTag Token refresh failed', error: failure);
                      emit(const AuthenticationState.unAuthenticated());
                    },
                    (newTokens) async {
                      log.d('$_logTag Tokens refreshed successfully');
                      final newUserResult = await _userRepository
                          .getCurrentUser(tokens.accessToken);
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
                  log.w('$_logTag Token is invalid, unauthenticated');
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
      log.e('$_logTag Check existing failed', error: e, stackTrace: stackTrace);
      emit(const AuthenticationState.unAuthenticated());
    }
  }

  Future<void> _handleNewUserLogin(
    _NewUserLogin event,
    Emitter<AuthenticationState> emit,
  ) async {
    log.d(
      '$_logTag _handleNewUserLogin called with email: ${event.user.userId}',
    );
    try {
      emit(const AuthenticationState.checking());

      await _authRepository.saveTokens(
        AuthTokenModel(
          accessToken: event.authToken,
          refreshToken: event.authToken,
          tokenType: 'bearer',
        ),
      );

      log.d('$_logTag Tokens saved successfully for new user');

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
    log.d(
      '$_logTag _handleCompleteProfile called for user: ${event.user.userId}',
    );
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
    log.d(
      '$_logTag _handleUserAuthenticated called for user: ${event.user.userId}',
    );
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
    log.d('$_logTag _handleLogout called');
    try {
      emit(const AuthenticationState.checking());

      final result = await _authRepository.logout();
      result.fold(
        (failure) {
          log.e('$_logTag Logout failed', error: failure);
          emit(const AuthenticationState.loggedOut());
        },
        (_) {
          log.d('$_logTag Logged out successfully');
          emit(const AuthenticationState.loggedOut());
        },
      );
    } catch (e, stackTrace) {
      log.e(
        '$_logTag Logout failed',
        error: e,
        stackTrace: stackTrace,
      );
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
    log.d('$_logTag _handleRegister called with email: ${event.email}');
    try {
      emit(const AuthenticationState.checking());

      final result = await _authRepository.register(
        email: event.email,
        username: event.username,
        password: event.password,
      );

      await result.fold(
        (failure) {
          log.e('$_logTag Registration failed', error: failure);
          emit(AuthenticationState.error(failure.toString()));
        },
        (user) async {
          // After successful registration, perform login
          final loginResult = await _authRepository.login(
            email: event.email,
            password: event.password,
          );

          await loginResult.fold(
            (failure) {
              log.e('$_logTag Auto-login after registration failed',
                  error: failure);
              emit(AuthenticationState.error(failure.toString()));
            },
            (tokens) async {
              log.d('$_logTag Registration and login successful');
              // Save tokens
              await _authRepository.saveTokens(tokens);

              emit(AuthenticationState.userNeedsProfileDetails(
                user: user,
                authToken: tokens.accessToken,
              ));
            },
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
    log.d('$_logTag _handleLogin called with email: ${event.email}');

    try {
      log.t('$_logTag Emitting checking state');
      emit(const AuthenticationState.checking());

      log.t('$_logTag Attempting login with email: ${event.email}');
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
          log.e('$_logTag Login failed', error: failure);
          emit(AuthenticationState.error(errorMessage));
        },
        (tokens) async {
          log.t(
            '$_logTag Login successful, tokens received: ${tokens.accessToken}',
          );

          try {
            // Use UserRepository instead of getCurrentUser
            final userResult =
                await _userRepository.getCurrentUser(tokens.accessToken);

            await userResult.fold(
              (failure) {
                final errorMessage = failure.when(
                  tokenExpired: () => 'Session expired',
                  serverError: (message) =>
                      message ?? 'Failed to get user details',
                  networkError: () => 'Network error',
                  invalidCredentials: () => 'Invalid credentials',
                );
                log.e('$_logTag Failed to fetch user details', error: failure);
                emit(AuthenticationState.error(errorMessage));
              },
              (user) {
                log.t(
                  '$_logTag User details fetched successfully: ${user.userId}',
                );
                if (user.userDetails == null) {
                  log.t('$_logTag User needs to complete profile');
                  emit(
                    AuthenticationState.userNeedsProfileDetails(
                      user: user,
                      authToken: tokens.accessToken,
                    ),
                  );
                } else {
                  log.t('$_logTag User is logged in');
                  emit(
                    AuthenticationState.userLoggedIn(
                      user: user,
                      authToken: tokens.accessToken,
                    ),
                  );
                }
              },
            );
          } catch (e) {
            log.e('$_logTag Error while fetching user details', error: e);
            emit(
              const AuthenticationState.error(
                'An unexpected error occurred',
              ),
            );
          }
        },
      );
    } catch (e) {
      log.e('$_logTag Unexpected error in login flow', error: e);
      emit(const AuthenticationState.error('An unexpected error occurred'));
    }
  }
}

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/users/models/update_profile_request_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:lulu_stylist_app/logic/api_base.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/user/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  final AuthenticationBloc _authBloc;
  final Logger log = Logger(printer: PrettyPrinter());

  UserBloc({
    required UserRepository userRepository,
    required AuthenticationBloc authBloc,
  })  : _userRepository = userRepository,
        _authBloc = authBloc,
        super(const UserState.initial()) {
    on<_UpdateProfile>(_handleUpdateProfile);
    on<_FetchUserData>(_handleFetchUserData);
    on<_UploadDisplayPicture>(_handleUploadDisplayPicture);
  }

  Future<void> _handleFetchUserData(
    _FetchUserData event,
    Emitter<UserState> emit,
  ) async {
    log.d('Fetching user data...');
    try {
      emit(const UserState.loading());

      // Get current auth state
      final authState = _authBloc.state;
      log.d('Current auth state: $authState');

      // Get token from auth state
      final accessToken = authState.maybeWhen(
        userLoggedIn: (user, token) {
          log.d('Got token from userLoggedIn state');
          return token;
        },
        userNeedsProfileDetails: (user, token) {
          log.d('Got token from userNeedsProfileDetails state');
          return token;
        },
        userAuthenticated: (user, token) {
          log.d('Got token from userAuthenticated state');
          return token;
        },
        orElse: () {
          log.d('No token found in auth state');
          return null;
        },
      );

      if (accessToken == null) {
        log.e('Token not found in auth state');
        emit(const UserState.failure('Authentication token not found'));
        return;
      }

      log.d('Making API call with token');
      final result = await _userRepository.getCurrentUser(accessToken);

      await result.fold(
        (failure) {
          final errorMessage = failure.when(
            tokenExpired: () => 'Session expired',
            serverError: (message) => message ?? 'Failed to fetch user data',
            networkError: () => 'Network error',
            invalidCredentials: () => 'Invalid credentials',
          );
          log.e('Fetch user data failed', error: failure);
          emit(UserState.failure(errorMessage));

          if (failure.maybeWhen(
            tokenExpired: () => true,
            orElse: () => false,
          )) {
            _authBloc.add(const AuthenticationEvent.sessionExpired());
          }
        },
        (userData) {
          log.i('User data fetched successfully: ${userData.toJson()}');
          // Always emit loaded state, regardless of whether userDetails exists
          emit(UserState.loaded(userData));
        },
      );
    } catch (e) {
      log.e('Unexpected error during fetch user data', error: e);
      emit(UserState.failure(e.toString()));
    }
  }

  Future<void> _handleUpdateProfile(
    _UpdateProfile event,
    Emitter<UserState> emit,
  ) async {
    log.d('Updating user profile...');
    try {
      emit(const UserState.loading());

      // Get current auth state to access token
      final authState = _authBloc.state;
      final accessToken = authState.maybeWhen(
        userNeedsProfileDetails: (user, token) => token,
        userLoggedIn: (user, token) => token,
        userAuthenticated: (user, token) => token,
        orElse: () => null,
      );

      if (accessToken == null || accessToken.isEmpty) {
        emit(const UserState.failure('Authentication token not found'));
        return;
      }

      final result = await _userRepository.updateUserProfile(
        accessToken,
        event.userData,
      );

      await result.fold(
        (failure) {
          final errorMessage = failure.when(
            tokenExpired: () => 'Session expired',
            serverError: (message) => message ?? 'Profile update failed',
            networkError: () => 'Network error',
            invalidCredentials: () => 'Invalid credentials',
          );
          log.e('Profile update failed', error: failure);
          emit(UserState.failure(errorMessage));

          // Notify auth bloc if token expired
          if (failure.maybeWhen(
            tokenExpired: () => true,
            orElse: () => false,
          )) {
            _authBloc.add(const AuthenticationEvent.sessionExpired());
          }
        },
        (updatedUser) {
          log.i('Profile updated successfully');
          emit(UserState.success(updatedUser));

          // Update auth state with new user data
          _authBloc.add(AuthenticationEvent.completeProfile(
            user: updatedUser,
            authToken: accessToken,
          ));
        },
      );
    } catch (e) {
      log.e('Unexpected error during profile update', error: e);
      emit(UserState.failure(e.toString()));
    }
  }

  Future<void> _handleUploadDisplayPicture(
    _UploadDisplayPicture event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(const UserState.loading());

      final authState = _authBloc.state;
      final accessToken = authState.maybeWhen(
        userNeedsProfileDetails: (user, token) => token,
        userLoggedIn: (user, token) => token,
        userAuthenticated: (user, token) => token,
        orElse: () => null,
      );

      if (accessToken == null || accessToken.isEmpty) {
        emit(const UserState.failure('Authentication token not found'));
        return;
      }

      final result = await _userRepository.uploadProfilePicture(
        accessToken,
        event.displayPicture,
      );

      await result.fold(
        (failure) {
          final errorMessage = failure.when(
            tokenExpired: () => 'Session expired',
            serverError: (message) =>
                message ?? 'Profile picture upload failed',
            networkError: () => 'Network error',
            invalidCredentials: () => 'Invalid credentials',
          );
          log.e('Profile picture upload failed', error: failure);
          emit(UserState.failure(errorMessage));

          if (failure.maybeWhen(
            tokenExpired: () => true,
            orElse: () => false,
          )) {
            _authBloc.add(const AuthenticationEvent.sessionExpired());
          }
        },
        (photoUrl) {
          log.i('Profile picture uploaded successfully');
          add(const UserEvent.fetchUserData()); // Refresh user data
          emit(UserState.profilePictureUploaded(photoUrl));
        },
      );
    } catch (e) {
      log.e('Unexpected error during profile picture upload', error: e);
      emit(UserState.failure(e.toString()));
    }
  }
}

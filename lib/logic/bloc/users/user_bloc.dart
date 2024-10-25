import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_update_request_model.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/users/user_repository.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._userRepository, this._authenticationBloc)
      : super(const UserState.initial()) {
    on<UpdateUserProfile>(_onUpdateUserProfile);
  }

  static const String logTag = 'UserBloc';

  final UserRepository _userRepository;
  final AuthenticationBloc _authenticationBloc;

  Future<void> _onUpdateUserProfile(
    _UpdateUserProfile event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.profileUpdating());

    try {
      final updatedUser = await _userRepository.updateUserProfile(
        event.userUpdateRequestModel,
      );

      log.d('_onUpdateUserProfile $updatedUser');
      emit(UserState.profileUpdateSuccess(updatedUser!));

      // Notify AuthenticationBloc of the updated user profile
      _authenticationBloc.add(
        AuthenticationEvent.profileUpdated(userData: updatedUser),
      );
    } catch (error) {
      log.e('Error updating user profile: $error');
      emit(UserState.profileUpdateError(error.toString()));
    }
  }
}

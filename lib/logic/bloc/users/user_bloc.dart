import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_update_request_model.dart';
import 'package:lulu_stylist_app/logic/api/users/user_api.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/users/user_repository.dart';

import 'package:lulu_stylist_app/logic/dio_factory.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const _Initial()) {
    on<_UpdateUserProfile>(_onUpdateUserProfile);
  }
  static const String logTag = 'UserBloc';

  final _authBloc = AuthenticationBloc();
  final _userRepo = UserRepository(UserApi(DioFactory().create()));

  Future<void> _onUpdateUserProfile(
    _UpdateUserProfile event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.profileUpdating());

    try {
      final updatedUser = await _userRepo.updateUserProfile(
        event.userUpdateRequestModel,
        event.imageFile,
      );

      print('_onUpdateUserProfile $updatedUser');
      emit(UserState.profileUpdateSuccess(updatedUser));
      //TODO: Check User Profile Update
      // _authBloc.add(
      //   AuthenticationEvent.userProfileUpdate(
      //     userModel: updatedUser,
      //   ),
      // );
    } catch (error) {
      print('erorrrr $error');
      emit(const UserState.profileUpdateError());
    }
  }
}

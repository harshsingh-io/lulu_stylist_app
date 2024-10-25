part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.updateUserProfile({
    required UserUpdateRequestModel userUpdateRequestModel,
    File? imageFile,
  }) = _UpdateUserProfile;
}

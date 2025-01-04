part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = _Started;
  const factory UserEvent.updateProfile({
    required UpdateProfileRequestModel userData,
  }) = _UpdateProfile;
  const factory UserEvent.uploadDisplayPicture({
    required File displayPicture,
  }) = _UploadDisplayPicture;
  const factory UserEvent.fetchUserData() = _FetchUserData;
}

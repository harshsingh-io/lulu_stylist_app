part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.userProfileComplete() = _UserProfileComplete;
  const factory UserState.profileUpdating() = _UserProfileUpdating;
  const factory UserState.profileUpdateSuccess(UserModel updatedProfile) =
      _ProfileUpdateSuccess;
  const factory UserState.pictureUploadSuccess() = _PictureUploadSuccess;
  const factory UserState.profileUpdateError() = _UserProfileUpdateError;
}

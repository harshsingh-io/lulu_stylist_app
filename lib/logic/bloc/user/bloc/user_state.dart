part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.success(UserModel user) = _Success;
  const factory UserState.failure(String message) = _Failure;
  const factory UserState.loaded(UserModel userData) = _Loaded;
  const factory UserState.profilePictureUploaded(String photoUrl) =
      _ProfilePictureUploaded;
}

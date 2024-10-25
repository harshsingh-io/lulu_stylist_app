// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  UserUpdateRequestModel get userUpdateRequestModel =>
      throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UserUpdateRequestModel userUpdateRequestModel, File? imageFile)
        updateUserProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            UserUpdateRequestModel userUpdateRequestModel, File? imageFile)?
        updateUserProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            UserUpdateRequestModel userUpdateRequestModel, File? imageFile)?
        updateUserProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUserProfile value) updateUserProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUserProfile value)? updateUserProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUserProfile value)? updateUserProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEventCopyWith<UserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
  @useResult
  $Res call({UserUpdateRequestModel userUpdateRequestModel, File? imageFile});

  $UserUpdateRequestModelCopyWith<$Res> get userUpdateRequestModel;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUpdateRequestModel = null,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      userUpdateRequestModel: null == userUpdateRequestModel
          ? _value.userUpdateRequestModel
          : userUpdateRequestModel // ignore: cast_nullable_to_non_nullable
              as UserUpdateRequestModel,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserUpdateRequestModelCopyWith<$Res> get userUpdateRequestModel {
    return $UserUpdateRequestModelCopyWith<$Res>(_value.userUpdateRequestModel,
        (value) {
      return _then(_value.copyWith(userUpdateRequestModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdateUserProfileImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$UpdateUserProfileImplCopyWith(_$UpdateUserProfileImpl value,
          $Res Function(_$UpdateUserProfileImpl) then) =
      __$$UpdateUserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserUpdateRequestModel userUpdateRequestModel, File? imageFile});

  @override
  $UserUpdateRequestModelCopyWith<$Res> get userUpdateRequestModel;
}

/// @nodoc
class __$$UpdateUserProfileImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UpdateUserProfileImpl>
    implements _$$UpdateUserProfileImplCopyWith<$Res> {
  __$$UpdateUserProfileImplCopyWithImpl(_$UpdateUserProfileImpl _value,
      $Res Function(_$UpdateUserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUpdateRequestModel = null,
    Object? imageFile = freezed,
  }) {
    return _then(_$UpdateUserProfileImpl(
      userUpdateRequestModel: null == userUpdateRequestModel
          ? _value.userUpdateRequestModel
          : userUpdateRequestModel // ignore: cast_nullable_to_non_nullable
              as UserUpdateRequestModel,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$UpdateUserProfileImpl implements _UpdateUserProfile {
  const _$UpdateUserProfileImpl(
      {required this.userUpdateRequestModel, this.imageFile});

  @override
  final UserUpdateRequestModel userUpdateRequestModel;
  @override
  final File? imageFile;

  @override
  String toString() {
    return 'UserEvent.updateUserProfile(userUpdateRequestModel: $userUpdateRequestModel, imageFile: $imageFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserProfileImpl &&
            (identical(other.userUpdateRequestModel, userUpdateRequestModel) ||
                other.userUpdateRequestModel == userUpdateRequestModel) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userUpdateRequestModel, imageFile);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserProfileImplCopyWith<_$UpdateUserProfileImpl> get copyWith =>
      __$$UpdateUserProfileImplCopyWithImpl<_$UpdateUserProfileImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UserUpdateRequestModel userUpdateRequestModel, File? imageFile)
        updateUserProfile,
  }) {
    return updateUserProfile(userUpdateRequestModel, imageFile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            UserUpdateRequestModel userUpdateRequestModel, File? imageFile)?
        updateUserProfile,
  }) {
    return updateUserProfile?.call(userUpdateRequestModel, imageFile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            UserUpdateRequestModel userUpdateRequestModel, File? imageFile)?
        updateUserProfile,
    required TResult orElse(),
  }) {
    if (updateUserProfile != null) {
      return updateUserProfile(userUpdateRequestModel, imageFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUserProfile value) updateUserProfile,
  }) {
    return updateUserProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUserProfile value)? updateUserProfile,
  }) {
    return updateUserProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUserProfile value)? updateUserProfile,
    required TResult orElse(),
  }) {
    if (updateUserProfile != null) {
      return updateUserProfile(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserProfile implements UserEvent {
  const factory _UpdateUserProfile(
      {required final UserUpdateRequestModel userUpdateRequestModel,
      final File? imageFile}) = _$UpdateUserProfileImpl;

  @override
  UserUpdateRequestModel get userUpdateRequestModel;
  @override
  File? get imageFile;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserProfileImplCopyWith<_$UpdateUserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() userProfileComplete,
    required TResult Function() profileUpdating,
    required TResult Function(UserModel updatedProfile) profileUpdateSuccess,
    required TResult Function() pictureUploadSuccess,
    required TResult Function() profileUpdateError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? userProfileComplete,
    TResult? Function()? profileUpdating,
    TResult? Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult? Function()? pictureUploadSuccess,
    TResult? Function()? profileUpdateError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? userProfileComplete,
    TResult Function()? profileUpdating,
    TResult Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult Function()? pictureUploadSuccess,
    TResult Function()? profileUpdateError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserProfileComplete value) userProfileComplete,
    required TResult Function(_UserProfileUpdating value) profileUpdating,
    required TResult Function(_ProfileUpdateSuccess value) profileUpdateSuccess,
    required TResult Function(_PictureUploadSuccess value) pictureUploadSuccess,
    required TResult Function(_UserProfileUpdateError value) profileUpdateError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UserProfileComplete value)? userProfileComplete,
    TResult? Function(_UserProfileUpdating value)? profileUpdating,
    TResult? Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult? Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult? Function(_UserProfileUpdateError value)? profileUpdateError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserProfileComplete value)? userProfileComplete,
    TResult Function(_UserProfileUpdating value)? profileUpdating,
    TResult Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult Function(_UserProfileUpdateError value)? profileUpdateError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UserState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() userProfileComplete,
    required TResult Function() profileUpdating,
    required TResult Function(UserModel updatedProfile) profileUpdateSuccess,
    required TResult Function() pictureUploadSuccess,
    required TResult Function() profileUpdateError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? userProfileComplete,
    TResult? Function()? profileUpdating,
    TResult? Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult? Function()? pictureUploadSuccess,
    TResult? Function()? profileUpdateError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? userProfileComplete,
    TResult Function()? profileUpdating,
    TResult Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult Function()? pictureUploadSuccess,
    TResult Function()? profileUpdateError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserProfileComplete value) userProfileComplete,
    required TResult Function(_UserProfileUpdating value) profileUpdating,
    required TResult Function(_ProfileUpdateSuccess value) profileUpdateSuccess,
    required TResult Function(_PictureUploadSuccess value) pictureUploadSuccess,
    required TResult Function(_UserProfileUpdateError value) profileUpdateError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UserProfileComplete value)? userProfileComplete,
    TResult? Function(_UserProfileUpdating value)? profileUpdating,
    TResult? Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult? Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult? Function(_UserProfileUpdateError value)? profileUpdateError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserProfileComplete value)? userProfileComplete,
    TResult Function(_UserProfileUpdating value)? profileUpdating,
    TResult Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult Function(_UserProfileUpdateError value)? profileUpdateError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() userProfileComplete,
    required TResult Function() profileUpdating,
    required TResult Function(UserModel updatedProfile) profileUpdateSuccess,
    required TResult Function() pictureUploadSuccess,
    required TResult Function() profileUpdateError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? userProfileComplete,
    TResult? Function()? profileUpdating,
    TResult? Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult? Function()? pictureUploadSuccess,
    TResult? Function()? profileUpdateError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? userProfileComplete,
    TResult Function()? profileUpdating,
    TResult Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult Function()? pictureUploadSuccess,
    TResult Function()? profileUpdateError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserProfileComplete value) userProfileComplete,
    required TResult Function(_UserProfileUpdating value) profileUpdating,
    required TResult Function(_ProfileUpdateSuccess value) profileUpdateSuccess,
    required TResult Function(_PictureUploadSuccess value) pictureUploadSuccess,
    required TResult Function(_UserProfileUpdateError value) profileUpdateError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UserProfileComplete value)? userProfileComplete,
    TResult? Function(_UserProfileUpdating value)? profileUpdating,
    TResult? Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult? Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult? Function(_UserProfileUpdateError value)? profileUpdateError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserProfileComplete value)? userProfileComplete,
    TResult Function(_UserProfileUpdating value)? profileUpdating,
    TResult Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult Function(_UserProfileUpdateError value)? profileUpdateError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$UserProfileCompleteImplCopyWith<$Res> {
  factory _$$UserProfileCompleteImplCopyWith(_$UserProfileCompleteImpl value,
          $Res Function(_$UserProfileCompleteImpl) then) =
      __$$UserProfileCompleteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserProfileCompleteImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserProfileCompleteImpl>
    implements _$$UserProfileCompleteImplCopyWith<$Res> {
  __$$UserProfileCompleteImplCopyWithImpl(_$UserProfileCompleteImpl _value,
      $Res Function(_$UserProfileCompleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserProfileCompleteImpl implements _UserProfileComplete {
  const _$UserProfileCompleteImpl();

  @override
  String toString() {
    return 'UserState.userProfileComplete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileCompleteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() userProfileComplete,
    required TResult Function() profileUpdating,
    required TResult Function(UserModel updatedProfile) profileUpdateSuccess,
    required TResult Function() pictureUploadSuccess,
    required TResult Function() profileUpdateError,
  }) {
    return userProfileComplete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? userProfileComplete,
    TResult? Function()? profileUpdating,
    TResult? Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult? Function()? pictureUploadSuccess,
    TResult? Function()? profileUpdateError,
  }) {
    return userProfileComplete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? userProfileComplete,
    TResult Function()? profileUpdating,
    TResult Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult Function()? pictureUploadSuccess,
    TResult Function()? profileUpdateError,
    required TResult orElse(),
  }) {
    if (userProfileComplete != null) {
      return userProfileComplete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserProfileComplete value) userProfileComplete,
    required TResult Function(_UserProfileUpdating value) profileUpdating,
    required TResult Function(_ProfileUpdateSuccess value) profileUpdateSuccess,
    required TResult Function(_PictureUploadSuccess value) pictureUploadSuccess,
    required TResult Function(_UserProfileUpdateError value) profileUpdateError,
  }) {
    return userProfileComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UserProfileComplete value)? userProfileComplete,
    TResult? Function(_UserProfileUpdating value)? profileUpdating,
    TResult? Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult? Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult? Function(_UserProfileUpdateError value)? profileUpdateError,
  }) {
    return userProfileComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserProfileComplete value)? userProfileComplete,
    TResult Function(_UserProfileUpdating value)? profileUpdating,
    TResult Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult Function(_UserProfileUpdateError value)? profileUpdateError,
    required TResult orElse(),
  }) {
    if (userProfileComplete != null) {
      return userProfileComplete(this);
    }
    return orElse();
  }
}

abstract class _UserProfileComplete implements UserState {
  const factory _UserProfileComplete() = _$UserProfileCompleteImpl;
}

/// @nodoc
abstract class _$$UserProfileUpdatingImplCopyWith<$Res> {
  factory _$$UserProfileUpdatingImplCopyWith(_$UserProfileUpdatingImpl value,
          $Res Function(_$UserProfileUpdatingImpl) then) =
      __$$UserProfileUpdatingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserProfileUpdatingImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserProfileUpdatingImpl>
    implements _$$UserProfileUpdatingImplCopyWith<$Res> {
  __$$UserProfileUpdatingImplCopyWithImpl(_$UserProfileUpdatingImpl _value,
      $Res Function(_$UserProfileUpdatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserProfileUpdatingImpl implements _UserProfileUpdating {
  const _$UserProfileUpdatingImpl();

  @override
  String toString() {
    return 'UserState.profileUpdating()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileUpdatingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() userProfileComplete,
    required TResult Function() profileUpdating,
    required TResult Function(UserModel updatedProfile) profileUpdateSuccess,
    required TResult Function() pictureUploadSuccess,
    required TResult Function() profileUpdateError,
  }) {
    return profileUpdating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? userProfileComplete,
    TResult? Function()? profileUpdating,
    TResult? Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult? Function()? pictureUploadSuccess,
    TResult? Function()? profileUpdateError,
  }) {
    return profileUpdating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? userProfileComplete,
    TResult Function()? profileUpdating,
    TResult Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult Function()? pictureUploadSuccess,
    TResult Function()? profileUpdateError,
    required TResult orElse(),
  }) {
    if (profileUpdating != null) {
      return profileUpdating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserProfileComplete value) userProfileComplete,
    required TResult Function(_UserProfileUpdating value) profileUpdating,
    required TResult Function(_ProfileUpdateSuccess value) profileUpdateSuccess,
    required TResult Function(_PictureUploadSuccess value) pictureUploadSuccess,
    required TResult Function(_UserProfileUpdateError value) profileUpdateError,
  }) {
    return profileUpdating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UserProfileComplete value)? userProfileComplete,
    TResult? Function(_UserProfileUpdating value)? profileUpdating,
    TResult? Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult? Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult? Function(_UserProfileUpdateError value)? profileUpdateError,
  }) {
    return profileUpdating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserProfileComplete value)? userProfileComplete,
    TResult Function(_UserProfileUpdating value)? profileUpdating,
    TResult Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult Function(_UserProfileUpdateError value)? profileUpdateError,
    required TResult orElse(),
  }) {
    if (profileUpdating != null) {
      return profileUpdating(this);
    }
    return orElse();
  }
}

abstract class _UserProfileUpdating implements UserState {
  const factory _UserProfileUpdating() = _$UserProfileUpdatingImpl;
}

/// @nodoc
abstract class _$$ProfileUpdateSuccessImplCopyWith<$Res> {
  factory _$$ProfileUpdateSuccessImplCopyWith(_$ProfileUpdateSuccessImpl value,
          $Res Function(_$ProfileUpdateSuccessImpl) then) =
      __$$ProfileUpdateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel updatedProfile});
}

/// @nodoc
class __$$ProfileUpdateSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$ProfileUpdateSuccessImpl>
    implements _$$ProfileUpdateSuccessImplCopyWith<$Res> {
  __$$ProfileUpdateSuccessImplCopyWithImpl(_$ProfileUpdateSuccessImpl _value,
      $Res Function(_$ProfileUpdateSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedProfile = freezed,
  }) {
    return _then(_$ProfileUpdateSuccessImpl(
      freezed == updatedProfile
          ? _value.updatedProfile
          : updatedProfile // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$ProfileUpdateSuccessImpl implements _ProfileUpdateSuccess {
  const _$ProfileUpdateSuccessImpl(this.updatedProfile);

  @override
  final UserModel updatedProfile;

  @override
  String toString() {
    return 'UserState.profileUpdateSuccess(updatedProfile: $updatedProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUpdateSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other.updatedProfile, updatedProfile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(updatedProfile));

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileUpdateSuccessImplCopyWith<_$ProfileUpdateSuccessImpl>
      get copyWith =>
          __$$ProfileUpdateSuccessImplCopyWithImpl<_$ProfileUpdateSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() userProfileComplete,
    required TResult Function() profileUpdating,
    required TResult Function(UserModel updatedProfile) profileUpdateSuccess,
    required TResult Function() pictureUploadSuccess,
    required TResult Function() profileUpdateError,
  }) {
    return profileUpdateSuccess(updatedProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? userProfileComplete,
    TResult? Function()? profileUpdating,
    TResult? Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult? Function()? pictureUploadSuccess,
    TResult? Function()? profileUpdateError,
  }) {
    return profileUpdateSuccess?.call(updatedProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? userProfileComplete,
    TResult Function()? profileUpdating,
    TResult Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult Function()? pictureUploadSuccess,
    TResult Function()? profileUpdateError,
    required TResult orElse(),
  }) {
    if (profileUpdateSuccess != null) {
      return profileUpdateSuccess(updatedProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserProfileComplete value) userProfileComplete,
    required TResult Function(_UserProfileUpdating value) profileUpdating,
    required TResult Function(_ProfileUpdateSuccess value) profileUpdateSuccess,
    required TResult Function(_PictureUploadSuccess value) pictureUploadSuccess,
    required TResult Function(_UserProfileUpdateError value) profileUpdateError,
  }) {
    return profileUpdateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UserProfileComplete value)? userProfileComplete,
    TResult? Function(_UserProfileUpdating value)? profileUpdating,
    TResult? Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult? Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult? Function(_UserProfileUpdateError value)? profileUpdateError,
  }) {
    return profileUpdateSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserProfileComplete value)? userProfileComplete,
    TResult Function(_UserProfileUpdating value)? profileUpdating,
    TResult Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult Function(_UserProfileUpdateError value)? profileUpdateError,
    required TResult orElse(),
  }) {
    if (profileUpdateSuccess != null) {
      return profileUpdateSuccess(this);
    }
    return orElse();
  }
}

abstract class _ProfileUpdateSuccess implements UserState {
  const factory _ProfileUpdateSuccess(final UserModel updatedProfile) =
      _$ProfileUpdateSuccessImpl;

  UserModel get updatedProfile;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileUpdateSuccessImplCopyWith<_$ProfileUpdateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PictureUploadSuccessImplCopyWith<$Res> {
  factory _$$PictureUploadSuccessImplCopyWith(_$PictureUploadSuccessImpl value,
          $Res Function(_$PictureUploadSuccessImpl) then) =
      __$$PictureUploadSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PictureUploadSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$PictureUploadSuccessImpl>
    implements _$$PictureUploadSuccessImplCopyWith<$Res> {
  __$$PictureUploadSuccessImplCopyWithImpl(_$PictureUploadSuccessImpl _value,
      $Res Function(_$PictureUploadSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PictureUploadSuccessImpl implements _PictureUploadSuccess {
  const _$PictureUploadSuccessImpl();

  @override
  String toString() {
    return 'UserState.pictureUploadSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureUploadSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() userProfileComplete,
    required TResult Function() profileUpdating,
    required TResult Function(UserModel updatedProfile) profileUpdateSuccess,
    required TResult Function() pictureUploadSuccess,
    required TResult Function() profileUpdateError,
  }) {
    return pictureUploadSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? userProfileComplete,
    TResult? Function()? profileUpdating,
    TResult? Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult? Function()? pictureUploadSuccess,
    TResult? Function()? profileUpdateError,
  }) {
    return pictureUploadSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? userProfileComplete,
    TResult Function()? profileUpdating,
    TResult Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult Function()? pictureUploadSuccess,
    TResult Function()? profileUpdateError,
    required TResult orElse(),
  }) {
    if (pictureUploadSuccess != null) {
      return pictureUploadSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserProfileComplete value) userProfileComplete,
    required TResult Function(_UserProfileUpdating value) profileUpdating,
    required TResult Function(_ProfileUpdateSuccess value) profileUpdateSuccess,
    required TResult Function(_PictureUploadSuccess value) pictureUploadSuccess,
    required TResult Function(_UserProfileUpdateError value) profileUpdateError,
  }) {
    return pictureUploadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UserProfileComplete value)? userProfileComplete,
    TResult? Function(_UserProfileUpdating value)? profileUpdating,
    TResult? Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult? Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult? Function(_UserProfileUpdateError value)? profileUpdateError,
  }) {
    return pictureUploadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserProfileComplete value)? userProfileComplete,
    TResult Function(_UserProfileUpdating value)? profileUpdating,
    TResult Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult Function(_UserProfileUpdateError value)? profileUpdateError,
    required TResult orElse(),
  }) {
    if (pictureUploadSuccess != null) {
      return pictureUploadSuccess(this);
    }
    return orElse();
  }
}

abstract class _PictureUploadSuccess implements UserState {
  const factory _PictureUploadSuccess() = _$PictureUploadSuccessImpl;
}

/// @nodoc
abstract class _$$UserProfileUpdateErrorImplCopyWith<$Res> {
  factory _$$UserProfileUpdateErrorImplCopyWith(
          _$UserProfileUpdateErrorImpl value,
          $Res Function(_$UserProfileUpdateErrorImpl) then) =
      __$$UserProfileUpdateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserProfileUpdateErrorImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserProfileUpdateErrorImpl>
    implements _$$UserProfileUpdateErrorImplCopyWith<$Res> {
  __$$UserProfileUpdateErrorImplCopyWithImpl(
      _$UserProfileUpdateErrorImpl _value,
      $Res Function(_$UserProfileUpdateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserProfileUpdateErrorImpl implements _UserProfileUpdateError {
  const _$UserProfileUpdateErrorImpl();

  @override
  String toString() {
    return 'UserState.profileUpdateError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileUpdateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() userProfileComplete,
    required TResult Function() profileUpdating,
    required TResult Function(UserModel updatedProfile) profileUpdateSuccess,
    required TResult Function() pictureUploadSuccess,
    required TResult Function() profileUpdateError,
  }) {
    return profileUpdateError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? userProfileComplete,
    TResult? Function()? profileUpdating,
    TResult? Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult? Function()? pictureUploadSuccess,
    TResult? Function()? profileUpdateError,
  }) {
    return profileUpdateError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? userProfileComplete,
    TResult Function()? profileUpdating,
    TResult Function(UserModel updatedProfile)? profileUpdateSuccess,
    TResult Function()? pictureUploadSuccess,
    TResult Function()? profileUpdateError,
    required TResult orElse(),
  }) {
    if (profileUpdateError != null) {
      return profileUpdateError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_UserProfileComplete value) userProfileComplete,
    required TResult Function(_UserProfileUpdating value) profileUpdating,
    required TResult Function(_ProfileUpdateSuccess value) profileUpdateSuccess,
    required TResult Function(_PictureUploadSuccess value) pictureUploadSuccess,
    required TResult Function(_UserProfileUpdateError value) profileUpdateError,
  }) {
    return profileUpdateError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_UserProfileComplete value)? userProfileComplete,
    TResult? Function(_UserProfileUpdating value)? profileUpdating,
    TResult? Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult? Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult? Function(_UserProfileUpdateError value)? profileUpdateError,
  }) {
    return profileUpdateError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_UserProfileComplete value)? userProfileComplete,
    TResult Function(_UserProfileUpdating value)? profileUpdating,
    TResult Function(_ProfileUpdateSuccess value)? profileUpdateSuccess,
    TResult Function(_PictureUploadSuccess value)? pictureUploadSuccess,
    TResult Function(_UserProfileUpdateError value)? profileUpdateError,
    required TResult orElse(),
  }) {
    if (profileUpdateError != null) {
      return profileUpdateError(this);
    }
    return orElse();
  }
}

abstract class _UserProfileUpdateError implements UserState {
  const factory _UserProfileUpdateError() = _$UserProfileUpdateErrorImpl;
}

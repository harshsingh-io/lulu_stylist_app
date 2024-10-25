// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() checkExisting,
    required TResult Function(String authToken, UserModel user) newUserLogin,
    required TResult Function() logout,
    required TResult Function(UserModel userModel) userProfileUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? checkExisting,
    TResult? Function(String authToken, UserModel user)? newUserLogin,
    TResult? Function()? logout,
    TResult? Function(UserModel userModel)? userProfileUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? checkExisting,
    TResult Function(String authToken, UserModel user)? newUserLogin,
    TResult Function()? logout,
    TResult Function(UserModel userModel)? userProfileUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CheckExisting value) checkExisting,
    required TResult Function(_NewUserLogin value) newUserLogin,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UserProfileUpdated value) userProfileUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CheckExisting value)? checkExisting,
    TResult? Function(_NewUserLogin value)? newUserLogin,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_UserProfileUpdated value)? userProfileUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CheckExisting value)? checkExisting,
    TResult Function(_NewUserLogin value)? newUserLogin,
    TResult Function(_Logout value)? logout,
    TResult Function(_UserProfileUpdated value)? userProfileUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res, AuthenticationEvent>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res, $Val extends AuthenticationEvent>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() checkExisting,
    required TResult Function(String authToken, UserModel user) newUserLogin,
    required TResult Function() logout,
    required TResult Function(UserModel userModel) userProfileUpdate,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? checkExisting,
    TResult? Function(String authToken, UserModel user)? newUserLogin,
    TResult? Function()? logout,
    TResult? Function(UserModel userModel)? userProfileUpdate,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? checkExisting,
    TResult Function(String authToken, UserModel user)? newUserLogin,
    TResult Function()? logout,
    TResult Function(UserModel userModel)? userProfileUpdate,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CheckExisting value) checkExisting,
    required TResult Function(_NewUserLogin value) newUserLogin,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UserProfileUpdated value) userProfileUpdate,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CheckExisting value)? checkExisting,
    TResult? Function(_NewUserLogin value)? newUserLogin,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_UserProfileUpdated value)? userProfileUpdate,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CheckExisting value)? checkExisting,
    TResult Function(_NewUserLogin value)? newUserLogin,
    TResult Function(_Logout value)? logout,
    TResult Function(_UserProfileUpdated value)? userProfileUpdate,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AuthenticationEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CheckExistingImplCopyWith<$Res> {
  factory _$$CheckExistingImplCopyWith(
          _$CheckExistingImpl value, $Res Function(_$CheckExistingImpl) then) =
      __$$CheckExistingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckExistingImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$CheckExistingImpl>
    implements _$$CheckExistingImplCopyWith<$Res> {
  __$$CheckExistingImplCopyWithImpl(
      _$CheckExistingImpl _value, $Res Function(_$CheckExistingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckExistingImpl implements _CheckExisting {
  const _$CheckExistingImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.checkExisting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckExistingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() checkExisting,
    required TResult Function(String authToken, UserModel user) newUserLogin,
    required TResult Function() logout,
    required TResult Function(UserModel userModel) userProfileUpdate,
  }) {
    return checkExisting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? checkExisting,
    TResult? Function(String authToken, UserModel user)? newUserLogin,
    TResult? Function()? logout,
    TResult? Function(UserModel userModel)? userProfileUpdate,
  }) {
    return checkExisting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? checkExisting,
    TResult Function(String authToken, UserModel user)? newUserLogin,
    TResult Function()? logout,
    TResult Function(UserModel userModel)? userProfileUpdate,
    required TResult orElse(),
  }) {
    if (checkExisting != null) {
      return checkExisting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CheckExisting value) checkExisting,
    required TResult Function(_NewUserLogin value) newUserLogin,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UserProfileUpdated value) userProfileUpdate,
  }) {
    return checkExisting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CheckExisting value)? checkExisting,
    TResult? Function(_NewUserLogin value)? newUserLogin,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_UserProfileUpdated value)? userProfileUpdate,
  }) {
    return checkExisting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CheckExisting value)? checkExisting,
    TResult Function(_NewUserLogin value)? newUserLogin,
    TResult Function(_Logout value)? logout,
    TResult Function(_UserProfileUpdated value)? userProfileUpdate,
    required TResult orElse(),
  }) {
    if (checkExisting != null) {
      return checkExisting(this);
    }
    return orElse();
  }
}

abstract class _CheckExisting implements AuthenticationEvent {
  const factory _CheckExisting() = _$CheckExistingImpl;
}

/// @nodoc
abstract class _$$NewUserLoginImplCopyWith<$Res> {
  factory _$$NewUserLoginImplCopyWith(
          _$NewUserLoginImpl value, $Res Function(_$NewUserLoginImpl) then) =
      __$$NewUserLoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String authToken, UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$NewUserLoginImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$NewUserLoginImpl>
    implements _$$NewUserLoginImplCopyWith<$Res> {
  __$$NewUserLoginImplCopyWithImpl(
      _$NewUserLoginImpl _value, $Res Function(_$NewUserLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authToken = null,
    Object? user = null,
  }) {
    return _then(_$NewUserLoginImpl(
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$NewUserLoginImpl implements _NewUserLogin {
  const _$NewUserLoginImpl({required this.authToken, required this.user});

  @override
  final String authToken;
  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthenticationEvent.newUserLogin(authToken: $authToken, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewUserLoginImpl &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authToken, user);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewUserLoginImplCopyWith<_$NewUserLoginImpl> get copyWith =>
      __$$NewUserLoginImplCopyWithImpl<_$NewUserLoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() checkExisting,
    required TResult Function(String authToken, UserModel user) newUserLogin,
    required TResult Function() logout,
    required TResult Function(UserModel userModel) userProfileUpdate,
  }) {
    return newUserLogin(authToken, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? checkExisting,
    TResult? Function(String authToken, UserModel user)? newUserLogin,
    TResult? Function()? logout,
    TResult? Function(UserModel userModel)? userProfileUpdate,
  }) {
    return newUserLogin?.call(authToken, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? checkExisting,
    TResult Function(String authToken, UserModel user)? newUserLogin,
    TResult Function()? logout,
    TResult Function(UserModel userModel)? userProfileUpdate,
    required TResult orElse(),
  }) {
    if (newUserLogin != null) {
      return newUserLogin(authToken, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CheckExisting value) checkExisting,
    required TResult Function(_NewUserLogin value) newUserLogin,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UserProfileUpdated value) userProfileUpdate,
  }) {
    return newUserLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CheckExisting value)? checkExisting,
    TResult? Function(_NewUserLogin value)? newUserLogin,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_UserProfileUpdated value)? userProfileUpdate,
  }) {
    return newUserLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CheckExisting value)? checkExisting,
    TResult Function(_NewUserLogin value)? newUserLogin,
    TResult Function(_Logout value)? logout,
    TResult Function(_UserProfileUpdated value)? userProfileUpdate,
    required TResult orElse(),
  }) {
    if (newUserLogin != null) {
      return newUserLogin(this);
    }
    return orElse();
  }
}

abstract class _NewUserLogin implements AuthenticationEvent {
  const factory _NewUserLogin(
      {required final String authToken,
      required final UserModel user}) = _$NewUserLoginImpl;

  String get authToken;
  UserModel get user;

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewUserLoginImplCopyWith<_$NewUserLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() checkExisting,
    required TResult Function(String authToken, UserModel user) newUserLogin,
    required TResult Function() logout,
    required TResult Function(UserModel userModel) userProfileUpdate,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? checkExisting,
    TResult? Function(String authToken, UserModel user)? newUserLogin,
    TResult? Function()? logout,
    TResult? Function(UserModel userModel)? userProfileUpdate,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? checkExisting,
    TResult Function(String authToken, UserModel user)? newUserLogin,
    TResult Function()? logout,
    TResult Function(UserModel userModel)? userProfileUpdate,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CheckExisting value) checkExisting,
    required TResult Function(_NewUserLogin value) newUserLogin,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UserProfileUpdated value) userProfileUpdate,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CheckExisting value)? checkExisting,
    TResult? Function(_NewUserLogin value)? newUserLogin,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_UserProfileUpdated value)? userProfileUpdate,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CheckExisting value)? checkExisting,
    TResult Function(_NewUserLogin value)? newUserLogin,
    TResult Function(_Logout value)? logout,
    TResult Function(_UserProfileUpdated value)? userProfileUpdate,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthenticationEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$UserProfileUpdatedImplCopyWith<$Res> {
  factory _$$UserProfileUpdatedImplCopyWith(_$UserProfileUpdatedImpl value,
          $Res Function(_$UserProfileUpdatedImpl) then) =
      __$$UserProfileUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel userModel});

  $UserModelCopyWith<$Res> get userModel;
}

/// @nodoc
class __$$UserProfileUpdatedImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$UserProfileUpdatedImpl>
    implements _$$UserProfileUpdatedImplCopyWith<$Res> {
  __$$UserProfileUpdatedImplCopyWithImpl(_$UserProfileUpdatedImpl _value,
      $Res Function(_$UserProfileUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = null,
  }) {
    return _then(_$UserProfileUpdatedImpl(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get userModel {
    return $UserModelCopyWith<$Res>(_value.userModel, (value) {
      return _then(_value.copyWith(userModel: value));
    });
  }
}

/// @nodoc

class _$UserProfileUpdatedImpl implements _UserProfileUpdated {
  const _$UserProfileUpdatedImpl({required this.userModel});

  @override
  final UserModel userModel;

  @override
  String toString() {
    return 'AuthenticationEvent.userProfileUpdate(userModel: $userModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileUpdatedImpl &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userModel);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileUpdatedImplCopyWith<_$UserProfileUpdatedImpl> get copyWith =>
      __$$UserProfileUpdatedImplCopyWithImpl<_$UserProfileUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() checkExisting,
    required TResult Function(String authToken, UserModel user) newUserLogin,
    required TResult Function() logout,
    required TResult Function(UserModel userModel) userProfileUpdate,
  }) {
    return userProfileUpdate(userModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? checkExisting,
    TResult? Function(String authToken, UserModel user)? newUserLogin,
    TResult? Function()? logout,
    TResult? Function(UserModel userModel)? userProfileUpdate,
  }) {
    return userProfileUpdate?.call(userModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? checkExisting,
    TResult Function(String authToken, UserModel user)? newUserLogin,
    TResult Function()? logout,
    TResult Function(UserModel userModel)? userProfileUpdate,
    required TResult orElse(),
  }) {
    if (userProfileUpdate != null) {
      return userProfileUpdate(userModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CheckExisting value) checkExisting,
    required TResult Function(_NewUserLogin value) newUserLogin,
    required TResult Function(_Logout value) logout,
    required TResult Function(_UserProfileUpdated value) userProfileUpdate,
  }) {
    return userProfileUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CheckExisting value)? checkExisting,
    TResult? Function(_NewUserLogin value)? newUserLogin,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_UserProfileUpdated value)? userProfileUpdate,
  }) {
    return userProfileUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CheckExisting value)? checkExisting,
    TResult Function(_NewUserLogin value)? newUserLogin,
    TResult Function(_Logout value)? logout,
    TResult Function(_UserProfileUpdated value)? userProfileUpdate,
    required TResult orElse(),
  }) {
    if (userProfileUpdate != null) {
      return userProfileUpdate(this);
    }
    return orElse();
  }
}

abstract class _UserProfileUpdated implements AuthenticationEvent {
  const factory _UserProfileUpdated({required final UserModel userModel}) =
      _$UserProfileUpdatedImpl;

  UserModel get userModel;

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileUpdatedImplCopyWith<_$UserProfileUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checking,
    required TResult Function(UserType userType, String phone, int attempt)
        inProgress,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() unAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel userModel, String authToken)
        userNeedsProfileDetails,
    required TResult Function() userNeedsOnboard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function(UserType userType, String phone, int attempt)? inProgress,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? unAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult? Function()? userNeedsOnboard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function(UserType userType, String phone, int attempt)? inProgress,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? unAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult Function()? userNeedsOnboard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Checking value) checking,
    required TResult Function(_InProgess value) inProgress,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserNeedsOnboard value) userNeedsOnboard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_InProgess value)? inProgress,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserNeedsOnboard value)? userNeedsOnboard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_InProgess value)? inProgress,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserNeedsOnboard value)? userNeedsOnboard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationState
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
    extends _$AuthenticationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  _$InitialImpl();

  @override
  String toString() {
    return 'AuthenticationState.initial()';
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
    required TResult Function() checking,
    required TResult Function(UserType userType, String phone, int attempt)
        inProgress,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() unAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel userModel, String authToken)
        userNeedsProfileDetails,
    required TResult Function() userNeedsOnboard,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function(UserType userType, String phone, int attempt)? inProgress,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? unAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult? Function()? userNeedsOnboard,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function(UserType userType, String phone, int attempt)? inProgress,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? unAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult Function()? userNeedsOnboard,
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
    required TResult Function(_Checking value) checking,
    required TResult Function(_InProgess value) inProgress,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserNeedsOnboard value) userNeedsOnboard,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_InProgess value)? inProgress,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserNeedsOnboard value)? userNeedsOnboard,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_InProgess value)? inProgress,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserNeedsOnboard value)? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthenticationState {
  factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CheckingImplCopyWith<$Res> {
  factory _$$CheckingImplCopyWith(
          _$CheckingImpl value, $Res Function(_$CheckingImpl) then) =
      __$$CheckingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckingImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$CheckingImpl>
    implements _$$CheckingImplCopyWith<$Res> {
  __$$CheckingImplCopyWithImpl(
      _$CheckingImpl _value, $Res Function(_$CheckingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckingImpl implements _Checking {
  _$CheckingImpl();

  @override
  String toString() {
    return 'AuthenticationState.checking()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checking,
    required TResult Function(UserType userType, String phone, int attempt)
        inProgress,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() unAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel userModel, String authToken)
        userNeedsProfileDetails,
    required TResult Function() userNeedsOnboard,
  }) {
    return checking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function(UserType userType, String phone, int attempt)? inProgress,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? unAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult? Function()? userNeedsOnboard,
  }) {
    return checking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function(UserType userType, String phone, int attempt)? inProgress,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? unAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult Function()? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (checking != null) {
      return checking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Checking value) checking,
    required TResult Function(_InProgess value) inProgress,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserNeedsOnboard value) userNeedsOnboard,
  }) {
    return checking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_InProgess value)? inProgress,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserNeedsOnboard value)? userNeedsOnboard,
  }) {
    return checking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_InProgess value)? inProgress,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserNeedsOnboard value)? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (checking != null) {
      return checking(this);
    }
    return orElse();
  }
}

abstract class _Checking implements AuthenticationState {
  factory _Checking() = _$CheckingImpl;
}

/// @nodoc
abstract class _$$InProgessImplCopyWith<$Res> {
  factory _$$InProgessImplCopyWith(
          _$InProgessImpl value, $Res Function(_$InProgessImpl) then) =
      __$$InProgessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserType userType, String phone, int attempt});
}

/// @nodoc
class __$$InProgessImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$InProgessImpl>
    implements _$$InProgessImplCopyWith<$Res> {
  __$$InProgessImplCopyWithImpl(
      _$InProgessImpl _value, $Res Function(_$InProgessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userType = null,
    Object? phone = null,
    Object? attempt = null,
  }) {
    return _then(_$InProgessImpl(
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      attempt: null == attempt
          ? _value.attempt
          : attempt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InProgessImpl implements _InProgess {
  _$InProgessImpl(
      {required this.userType, required this.phone, required this.attempt});

  @override
  final UserType userType;
  @override
  final String phone;
  @override
  final int attempt;

  @override
  String toString() {
    return 'AuthenticationState.inProgress(userType: $userType, phone: $phone, attempt: $attempt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InProgessImpl &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.attempt, attempt) || other.attempt == attempt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userType, phone, attempt);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InProgessImplCopyWith<_$InProgessImpl> get copyWith =>
      __$$InProgessImplCopyWithImpl<_$InProgessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checking,
    required TResult Function(UserType userType, String phone, int attempt)
        inProgress,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() unAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel userModel, String authToken)
        userNeedsProfileDetails,
    required TResult Function() userNeedsOnboard,
  }) {
    return inProgress(userType, phone, attempt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function(UserType userType, String phone, int attempt)? inProgress,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? unAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult? Function()? userNeedsOnboard,
  }) {
    return inProgress?.call(userType, phone, attempt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function(UserType userType, String phone, int attempt)? inProgress,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? unAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult Function()? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(userType, phone, attempt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Checking value) checking,
    required TResult Function(_InProgess value) inProgress,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserNeedsOnboard value) userNeedsOnboard,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_InProgess value)? inProgress,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserNeedsOnboard value)? userNeedsOnboard,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_InProgess value)? inProgress,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserNeedsOnboard value)? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _InProgess implements AuthenticationState {
  factory _InProgess(
      {required final UserType userType,
      required final String phone,
      required final int attempt}) = _$InProgessImpl;

  UserType get userType;
  String get phone;
  int get attempt;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InProgessImplCopyWith<_$InProgessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserAuthenticatedImplCopyWith<$Res> {
  factory _$$UserAuthenticatedImplCopyWith(_$UserAuthenticatedImpl value,
          $Res Function(_$UserAuthenticatedImpl) then) =
      __$$UserAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user, String authToken});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$UserAuthenticatedImpl>
    implements _$$UserAuthenticatedImplCopyWith<$Res> {
  __$$UserAuthenticatedImplCopyWithImpl(_$UserAuthenticatedImpl _value,
      $Res Function(_$UserAuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? authToken = null,
  }) {
    return _then(_$UserAuthenticatedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UserAuthenticatedImpl implements _UserAuthenticated {
  _$UserAuthenticatedImpl({required this.user, required this.authToken});

  @override
  final UserModel user;
  @override
  final String authToken;

  @override
  String toString() {
    return 'AuthenticationState.userAuthenticated(user: $user, authToken: $authToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAuthenticatedImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, authToken);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAuthenticatedImplCopyWith<_$UserAuthenticatedImpl> get copyWith =>
      __$$UserAuthenticatedImplCopyWithImpl<_$UserAuthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checking,
    required TResult Function(UserType userType, String phone, int attempt)
        inProgress,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() unAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel userModel, String authToken)
        userNeedsProfileDetails,
    required TResult Function() userNeedsOnboard,
  }) {
    return userAuthenticated(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function(UserType userType, String phone, int attempt)? inProgress,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? unAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult? Function()? userNeedsOnboard,
  }) {
    return userAuthenticated?.call(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function(UserType userType, String phone, int attempt)? inProgress,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? unAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult Function()? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (userAuthenticated != null) {
      return userAuthenticated(user, authToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Checking value) checking,
    required TResult Function(_InProgess value) inProgress,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserNeedsOnboard value) userNeedsOnboard,
  }) {
    return userAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_InProgess value)? inProgress,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserNeedsOnboard value)? userNeedsOnboard,
  }) {
    return userAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_InProgess value)? inProgress,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserNeedsOnboard value)? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (userAuthenticated != null) {
      return userAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _UserAuthenticated implements AuthenticationState {
  factory _UserAuthenticated(
      {required final UserModel user,
      required final String authToken}) = _$UserAuthenticatedImpl;

  UserModel get user;
  String get authToken;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAuthenticatedImplCopyWith<_$UserAuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnAuthenticatedImplCopyWith<$Res> {
  factory _$$UnAuthenticatedImplCopyWith(_$UnAuthenticatedImpl value,
          $Res Function(_$UnAuthenticatedImpl) then) =
      __$$UnAuthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$UnAuthenticatedImpl>
    implements _$$UnAuthenticatedImplCopyWith<$Res> {
  __$$UnAuthenticatedImplCopyWithImpl(
      _$UnAuthenticatedImpl _value, $Res Function(_$UnAuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnAuthenticatedImpl implements _UnAuthenticated {
  _$UnAuthenticatedImpl();

  @override
  String toString() {
    return 'AuthenticationState.unAuthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnAuthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checking,
    required TResult Function(UserType userType, String phone, int attempt)
        inProgress,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() unAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel userModel, String authToken)
        userNeedsProfileDetails,
    required TResult Function() userNeedsOnboard,
  }) {
    return unAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function(UserType userType, String phone, int attempt)? inProgress,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? unAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult? Function()? userNeedsOnboard,
  }) {
    return unAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function(UserType userType, String phone, int attempt)? inProgress,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? unAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult Function()? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Checking value) checking,
    required TResult Function(_InProgess value) inProgress,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserNeedsOnboard value) userNeedsOnboard,
  }) {
    return unAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_InProgess value)? inProgress,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserNeedsOnboard value)? userNeedsOnboard,
  }) {
    return unAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_InProgess value)? inProgress,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserNeedsOnboard value)? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _UnAuthenticated implements AuthenticationState {
  factory _UnAuthenticated() = _$UnAuthenticatedImpl;
}

/// @nodoc
abstract class _$$LoggedOutImplCopyWith<$Res> {
  factory _$$LoggedOutImplCopyWith(
          _$LoggedOutImpl value, $Res Function(_$LoggedOutImpl) then) =
      __$$LoggedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoggedOutImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$LoggedOutImpl>
    implements _$$LoggedOutImplCopyWith<$Res> {
  __$$LoggedOutImplCopyWithImpl(
      _$LoggedOutImpl _value, $Res Function(_$LoggedOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoggedOutImpl implements _LoggedOut {
  _$LoggedOutImpl();

  @override
  String toString() {
    return 'AuthenticationState.loggedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoggedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checking,
    required TResult Function(UserType userType, String phone, int attempt)
        inProgress,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() unAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel userModel, String authToken)
        userNeedsProfileDetails,
    required TResult Function() userNeedsOnboard,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function(UserType userType, String phone, int attempt)? inProgress,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? unAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult? Function()? userNeedsOnboard,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function(UserType userType, String phone, int attempt)? inProgress,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? unAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult Function()? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Checking value) checking,
    required TResult Function(_InProgess value) inProgress,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserNeedsOnboard value) userNeedsOnboard,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_InProgess value)? inProgress,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserNeedsOnboard value)? userNeedsOnboard,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_InProgess value)? inProgress,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserNeedsOnboard value)? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class _LoggedOut implements AuthenticationState {
  factory _LoggedOut() = _$LoggedOutImpl;
}

/// @nodoc
abstract class _$$UserLoggedInImplCopyWith<$Res> {
  factory _$$UserLoggedInImplCopyWith(
          _$UserLoggedInImpl value, $Res Function(_$UserLoggedInImpl) then) =
      __$$UserLoggedInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user, String authToken});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserLoggedInImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$UserLoggedInImpl>
    implements _$$UserLoggedInImplCopyWith<$Res> {
  __$$UserLoggedInImplCopyWithImpl(
      _$UserLoggedInImpl _value, $Res Function(_$UserLoggedInImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? authToken = null,
  }) {
    return _then(_$UserLoggedInImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UserLoggedInImpl implements _UserLoggedIn {
  _$UserLoggedInImpl({required this.user, required this.authToken});

  @override
  final UserModel user;
  @override
  final String authToken;

  @override
  String toString() {
    return 'AuthenticationState.userLoggedIn(user: $user, authToken: $authToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoggedInImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, authToken);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoggedInImplCopyWith<_$UserLoggedInImpl> get copyWith =>
      __$$UserLoggedInImplCopyWithImpl<_$UserLoggedInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checking,
    required TResult Function(UserType userType, String phone, int attempt)
        inProgress,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() unAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel userModel, String authToken)
        userNeedsProfileDetails,
    required TResult Function() userNeedsOnboard,
  }) {
    return userLoggedIn(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function(UserType userType, String phone, int attempt)? inProgress,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? unAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult? Function()? userNeedsOnboard,
  }) {
    return userLoggedIn?.call(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function(UserType userType, String phone, int attempt)? inProgress,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? unAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult Function()? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (userLoggedIn != null) {
      return userLoggedIn(user, authToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Checking value) checking,
    required TResult Function(_InProgess value) inProgress,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserNeedsOnboard value) userNeedsOnboard,
  }) {
    return userLoggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_InProgess value)? inProgress,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserNeedsOnboard value)? userNeedsOnboard,
  }) {
    return userLoggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_InProgess value)? inProgress,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserNeedsOnboard value)? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (userLoggedIn != null) {
      return userLoggedIn(this);
    }
    return orElse();
  }
}

abstract class _UserLoggedIn implements AuthenticationState {
  factory _UserLoggedIn(
      {required final UserModel user,
      required final String authToken}) = _$UserLoggedInImpl;

  UserModel get user;
  String get authToken;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserLoggedInImplCopyWith<_$UserLoggedInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserNeedsProfileDetailsImplCopyWith<$Res> {
  factory _$$UserNeedsProfileDetailsImplCopyWith(
          _$UserNeedsProfileDetailsImpl value,
          $Res Function(_$UserNeedsProfileDetailsImpl) then) =
      __$$UserNeedsProfileDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel userModel, String authToken});

  $UserModelCopyWith<$Res> get userModel;
}

/// @nodoc
class __$$UserNeedsProfileDetailsImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res,
        _$UserNeedsProfileDetailsImpl>
    implements _$$UserNeedsProfileDetailsImplCopyWith<$Res> {
  __$$UserNeedsProfileDetailsImplCopyWithImpl(
      _$UserNeedsProfileDetailsImpl _value,
      $Res Function(_$UserNeedsProfileDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = null,
    Object? authToken = null,
  }) {
    return _then(_$UserNeedsProfileDetailsImpl(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get userModel {
    return $UserModelCopyWith<$Res>(_value.userModel, (value) {
      return _then(_value.copyWith(userModel: value));
    });
  }
}

/// @nodoc

class _$UserNeedsProfileDetailsImpl implements _UserNeedsProfileDetails {
  _$UserNeedsProfileDetailsImpl(
      {required this.userModel, required this.authToken});

  @override
  final UserModel userModel;
  @override
  final String authToken;

  @override
  String toString() {
    return 'AuthenticationState.userNeedsProfileDetails(userModel: $userModel, authToken: $authToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNeedsProfileDetailsImpl &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userModel, authToken);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNeedsProfileDetailsImplCopyWith<_$UserNeedsProfileDetailsImpl>
      get copyWith => __$$UserNeedsProfileDetailsImplCopyWithImpl<
          _$UserNeedsProfileDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checking,
    required TResult Function(UserType userType, String phone, int attempt)
        inProgress,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() unAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel userModel, String authToken)
        userNeedsProfileDetails,
    required TResult Function() userNeedsOnboard,
  }) {
    return userNeedsProfileDetails(userModel, authToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function(UserType userType, String phone, int attempt)? inProgress,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? unAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult? Function()? userNeedsOnboard,
  }) {
    return userNeedsProfileDetails?.call(userModel, authToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function(UserType userType, String phone, int attempt)? inProgress,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? unAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult Function()? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (userNeedsProfileDetails != null) {
      return userNeedsProfileDetails(userModel, authToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Checking value) checking,
    required TResult Function(_InProgess value) inProgress,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserNeedsOnboard value) userNeedsOnboard,
  }) {
    return userNeedsProfileDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_InProgess value)? inProgress,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserNeedsOnboard value)? userNeedsOnboard,
  }) {
    return userNeedsProfileDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_InProgess value)? inProgress,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserNeedsOnboard value)? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (userNeedsProfileDetails != null) {
      return userNeedsProfileDetails(this);
    }
    return orElse();
  }
}

abstract class _UserNeedsProfileDetails implements AuthenticationState {
  factory _UserNeedsProfileDetails(
      {required final UserModel userModel,
      required final String authToken}) = _$UserNeedsProfileDetailsImpl;

  UserModel get userModel;
  String get authToken;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserNeedsProfileDetailsImplCopyWith<_$UserNeedsProfileDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserNeedsOnboardImplCopyWith<$Res> {
  factory _$$UserNeedsOnboardImplCopyWith(_$UserNeedsOnboardImpl value,
          $Res Function(_$UserNeedsOnboardImpl) then) =
      __$$UserNeedsOnboardImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserNeedsOnboardImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$UserNeedsOnboardImpl>
    implements _$$UserNeedsOnboardImplCopyWith<$Res> {
  __$$UserNeedsOnboardImplCopyWithImpl(_$UserNeedsOnboardImpl _value,
      $Res Function(_$UserNeedsOnboardImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserNeedsOnboardImpl implements _UserNeedsOnboard {
  _$UserNeedsOnboardImpl();

  @override
  String toString() {
    return 'AuthenticationState.userNeedsOnboard()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserNeedsOnboardImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checking,
    required TResult Function(UserType userType, String phone, int attempt)
        inProgress,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() unAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel userModel, String authToken)
        userNeedsProfileDetails,
    required TResult Function() userNeedsOnboard,
  }) {
    return userNeedsOnboard();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function(UserType userType, String phone, int attempt)? inProgress,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? unAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult? Function()? userNeedsOnboard,
  }) {
    return userNeedsOnboard?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function(UserType userType, String phone, int attempt)? inProgress,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? unAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel userModel, String authToken)?
        userNeedsProfileDetails,
    TResult Function()? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (userNeedsOnboard != null) {
      return userNeedsOnboard();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Checking value) checking,
    required TResult Function(_InProgess value) inProgress,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserNeedsOnboard value) userNeedsOnboard,
  }) {
    return userNeedsOnboard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_InProgess value)? inProgress,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserNeedsOnboard value)? userNeedsOnboard,
  }) {
    return userNeedsOnboard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_InProgess value)? inProgress,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserNeedsOnboard value)? userNeedsOnboard,
    required TResult orElse(),
  }) {
    if (userNeedsOnboard != null) {
      return userNeedsOnboard(this);
    }
    return orElse();
  }
}

abstract class _UserNeedsOnboard implements AuthenticationState {
  factory _UserNeedsOnboard() = _$UserNeedsOnboardImpl;
}

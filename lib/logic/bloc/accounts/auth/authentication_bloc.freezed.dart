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
    required TResult Function() checkExisting,
    required TResult Function(String authToken, UserModel user) newUserLogin,
    required TResult Function(UserModel user, String authToken) completeProfile,
    required TResult Function(UserModel user, String authToken) authenticatUser,
    required TResult Function() logoutRequested,
    required TResult Function() sessionExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkExisting,
    TResult? Function(String authToken, UserModel user)? newUserLogin,
    TResult? Function(UserModel user, String authToken)? completeProfile,
    TResult? Function(UserModel user, String authToken)? authenticatUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? sessionExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkExisting,
    TResult Function(String authToken, UserModel user)? newUserLogin,
    TResult Function(UserModel user, String authToken)? completeProfile,
    TResult Function(UserModel user, String authToken)? authenticatUser,
    TResult Function()? logoutRequested,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckExisting value) checkExisting,
    required TResult Function(_NewUserLogin value) newUserLogin,
    required TResult Function(_CompleteProfile value) completeProfile,
    required TResult Function(_AuthenticateUser value) authenticatUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_SessionExpired value) sessionExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckExisting value)? checkExisting,
    TResult? Function(_NewUserLogin value)? newUserLogin,
    TResult? Function(_CompleteProfile value)? completeProfile,
    TResult? Function(_AuthenticateUser value)? authenticatUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_SessionExpired value)? sessionExpired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckExisting value)? checkExisting,
    TResult Function(_NewUserLogin value)? newUserLogin,
    TResult Function(_CompleteProfile value)? completeProfile,
    TResult Function(_AuthenticateUser value)? authenticatUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_SessionExpired value)? sessionExpired,
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
    required TResult Function() checkExisting,
    required TResult Function(String authToken, UserModel user) newUserLogin,
    required TResult Function(UserModel user, String authToken) completeProfile,
    required TResult Function(UserModel user, String authToken) authenticatUser,
    required TResult Function() logoutRequested,
    required TResult Function() sessionExpired,
  }) {
    return checkExisting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkExisting,
    TResult? Function(String authToken, UserModel user)? newUserLogin,
    TResult? Function(UserModel user, String authToken)? completeProfile,
    TResult? Function(UserModel user, String authToken)? authenticatUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? sessionExpired,
  }) {
    return checkExisting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkExisting,
    TResult Function(String authToken, UserModel user)? newUserLogin,
    TResult Function(UserModel user, String authToken)? completeProfile,
    TResult Function(UserModel user, String authToken)? authenticatUser,
    TResult Function()? logoutRequested,
    TResult Function()? sessionExpired,
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
    required TResult Function(_CheckExisting value) checkExisting,
    required TResult Function(_NewUserLogin value) newUserLogin,
    required TResult Function(_CompleteProfile value) completeProfile,
    required TResult Function(_AuthenticateUser value) authenticatUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_SessionExpired value) sessionExpired,
  }) {
    return checkExisting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckExisting value)? checkExisting,
    TResult? Function(_NewUserLogin value)? newUserLogin,
    TResult? Function(_CompleteProfile value)? completeProfile,
    TResult? Function(_AuthenticateUser value)? authenticatUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_SessionExpired value)? sessionExpired,
  }) {
    return checkExisting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckExisting value)? checkExisting,
    TResult Function(_NewUserLogin value)? newUserLogin,
    TResult Function(_CompleteProfile value)? completeProfile,
    TResult Function(_AuthenticateUser value)? authenticatUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_SessionExpired value)? sessionExpired,
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
    required TResult Function() checkExisting,
    required TResult Function(String authToken, UserModel user) newUserLogin,
    required TResult Function(UserModel user, String authToken) completeProfile,
    required TResult Function(UserModel user, String authToken) authenticatUser,
    required TResult Function() logoutRequested,
    required TResult Function() sessionExpired,
  }) {
    return newUserLogin(authToken, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkExisting,
    TResult? Function(String authToken, UserModel user)? newUserLogin,
    TResult? Function(UserModel user, String authToken)? completeProfile,
    TResult? Function(UserModel user, String authToken)? authenticatUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? sessionExpired,
  }) {
    return newUserLogin?.call(authToken, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkExisting,
    TResult Function(String authToken, UserModel user)? newUserLogin,
    TResult Function(UserModel user, String authToken)? completeProfile,
    TResult Function(UserModel user, String authToken)? authenticatUser,
    TResult Function()? logoutRequested,
    TResult Function()? sessionExpired,
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
    required TResult Function(_CheckExisting value) checkExisting,
    required TResult Function(_NewUserLogin value) newUserLogin,
    required TResult Function(_CompleteProfile value) completeProfile,
    required TResult Function(_AuthenticateUser value) authenticatUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_SessionExpired value) sessionExpired,
  }) {
    return newUserLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckExisting value)? checkExisting,
    TResult? Function(_NewUserLogin value)? newUserLogin,
    TResult? Function(_CompleteProfile value)? completeProfile,
    TResult? Function(_AuthenticateUser value)? authenticatUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_SessionExpired value)? sessionExpired,
  }) {
    return newUserLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckExisting value)? checkExisting,
    TResult Function(_NewUserLogin value)? newUserLogin,
    TResult Function(_CompleteProfile value)? completeProfile,
    TResult Function(_AuthenticateUser value)? authenticatUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_SessionExpired value)? sessionExpired,
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
abstract class _$$CompleteProfileImplCopyWith<$Res> {
  factory _$$CompleteProfileImplCopyWith(_$CompleteProfileImpl value,
          $Res Function(_$CompleteProfileImpl) then) =
      __$$CompleteProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user, String authToken});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$CompleteProfileImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$CompleteProfileImpl>
    implements _$$CompleteProfileImplCopyWith<$Res> {
  __$$CompleteProfileImplCopyWithImpl(
      _$CompleteProfileImpl _value, $Res Function(_$CompleteProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? authToken = null,
  }) {
    return _then(_$CompleteProfileImpl(
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

class _$CompleteProfileImpl implements _CompleteProfile {
  const _$CompleteProfileImpl({required this.user, required this.authToken});

  @override
  final UserModel user;
  @override
  final String authToken;

  @override
  String toString() {
    return 'AuthenticationEvent.completeProfile(user: $user, authToken: $authToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteProfileImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, authToken);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteProfileImplCopyWith<_$CompleteProfileImpl> get copyWith =>
      __$$CompleteProfileImplCopyWithImpl<_$CompleteProfileImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkExisting,
    required TResult Function(String authToken, UserModel user) newUserLogin,
    required TResult Function(UserModel user, String authToken) completeProfile,
    required TResult Function(UserModel user, String authToken) authenticatUser,
    required TResult Function() logoutRequested,
    required TResult Function() sessionExpired,
  }) {
    return completeProfile(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkExisting,
    TResult? Function(String authToken, UserModel user)? newUserLogin,
    TResult? Function(UserModel user, String authToken)? completeProfile,
    TResult? Function(UserModel user, String authToken)? authenticatUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? sessionExpired,
  }) {
    return completeProfile?.call(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkExisting,
    TResult Function(String authToken, UserModel user)? newUserLogin,
    TResult Function(UserModel user, String authToken)? completeProfile,
    TResult Function(UserModel user, String authToken)? authenticatUser,
    TResult Function()? logoutRequested,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) {
    if (completeProfile != null) {
      return completeProfile(user, authToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckExisting value) checkExisting,
    required TResult Function(_NewUserLogin value) newUserLogin,
    required TResult Function(_CompleteProfile value) completeProfile,
    required TResult Function(_AuthenticateUser value) authenticatUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_SessionExpired value) sessionExpired,
  }) {
    return completeProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckExisting value)? checkExisting,
    TResult? Function(_NewUserLogin value)? newUserLogin,
    TResult? Function(_CompleteProfile value)? completeProfile,
    TResult? Function(_AuthenticateUser value)? authenticatUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_SessionExpired value)? sessionExpired,
  }) {
    return completeProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckExisting value)? checkExisting,
    TResult Function(_NewUserLogin value)? newUserLogin,
    TResult Function(_CompleteProfile value)? completeProfile,
    TResult Function(_AuthenticateUser value)? authenticatUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_SessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) {
    if (completeProfile != null) {
      return completeProfile(this);
    }
    return orElse();
  }
}

abstract class _CompleteProfile implements AuthenticationEvent {
  const factory _CompleteProfile(
      {required final UserModel user,
      required final String authToken}) = _$CompleteProfileImpl;

  UserModel get user;
  String get authToken;

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteProfileImplCopyWith<_$CompleteProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticateUserImplCopyWith<$Res> {
  factory _$$AuthenticateUserImplCopyWith(_$AuthenticateUserImpl value,
          $Res Function(_$AuthenticateUserImpl) then) =
      __$$AuthenticateUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user, String authToken});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthenticateUserImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$AuthenticateUserImpl>
    implements _$$AuthenticateUserImplCopyWith<$Res> {
  __$$AuthenticateUserImplCopyWithImpl(_$AuthenticateUserImpl _value,
      $Res Function(_$AuthenticateUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? authToken = null,
  }) {
    return _then(_$AuthenticateUserImpl(
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

class _$AuthenticateUserImpl implements _AuthenticateUser {
  const _$AuthenticateUserImpl({required this.user, required this.authToken});

  @override
  final UserModel user;
  @override
  final String authToken;

  @override
  String toString() {
    return 'AuthenticationEvent.authenticatUser(user: $user, authToken: $authToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticateUserImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, authToken);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticateUserImplCopyWith<_$AuthenticateUserImpl> get copyWith =>
      __$$AuthenticateUserImplCopyWithImpl<_$AuthenticateUserImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkExisting,
    required TResult Function(String authToken, UserModel user) newUserLogin,
    required TResult Function(UserModel user, String authToken) completeProfile,
    required TResult Function(UserModel user, String authToken) authenticatUser,
    required TResult Function() logoutRequested,
    required TResult Function() sessionExpired,
  }) {
    return authenticatUser(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkExisting,
    TResult? Function(String authToken, UserModel user)? newUserLogin,
    TResult? Function(UserModel user, String authToken)? completeProfile,
    TResult? Function(UserModel user, String authToken)? authenticatUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? sessionExpired,
  }) {
    return authenticatUser?.call(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkExisting,
    TResult Function(String authToken, UserModel user)? newUserLogin,
    TResult Function(UserModel user, String authToken)? completeProfile,
    TResult Function(UserModel user, String authToken)? authenticatUser,
    TResult Function()? logoutRequested,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) {
    if (authenticatUser != null) {
      return authenticatUser(user, authToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckExisting value) checkExisting,
    required TResult Function(_NewUserLogin value) newUserLogin,
    required TResult Function(_CompleteProfile value) completeProfile,
    required TResult Function(_AuthenticateUser value) authenticatUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_SessionExpired value) sessionExpired,
  }) {
    return authenticatUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckExisting value)? checkExisting,
    TResult? Function(_NewUserLogin value)? newUserLogin,
    TResult? Function(_CompleteProfile value)? completeProfile,
    TResult? Function(_AuthenticateUser value)? authenticatUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_SessionExpired value)? sessionExpired,
  }) {
    return authenticatUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckExisting value)? checkExisting,
    TResult Function(_NewUserLogin value)? newUserLogin,
    TResult Function(_CompleteProfile value)? completeProfile,
    TResult Function(_AuthenticateUser value)? authenticatUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_SessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) {
    if (authenticatUser != null) {
      return authenticatUser(this);
    }
    return orElse();
  }
}

abstract class _AuthenticateUser implements AuthenticationEvent {
  const factory _AuthenticateUser(
      {required final UserModel user,
      required final String authToken}) = _$AuthenticateUserImpl;

  UserModel get user;
  String get authToken;

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticateUserImplCopyWith<_$AuthenticateUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutRequestedImplCopyWith<$Res> {
  factory _$$LogoutRequestedImplCopyWith(_$LogoutRequestedImpl value,
          $Res Function(_$LogoutRequestedImpl) then) =
      __$$LogoutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutRequestedImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$LogoutRequestedImpl>
    implements _$$LogoutRequestedImplCopyWith<$Res> {
  __$$LogoutRequestedImplCopyWithImpl(
      _$LogoutRequestedImpl _value, $Res Function(_$LogoutRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutRequestedImpl implements _LogoutRequested {
  const _$LogoutRequestedImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.logoutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkExisting,
    required TResult Function(String authToken, UserModel user) newUserLogin,
    required TResult Function(UserModel user, String authToken) completeProfile,
    required TResult Function(UserModel user, String authToken) authenticatUser,
    required TResult Function() logoutRequested,
    required TResult Function() sessionExpired,
  }) {
    return logoutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkExisting,
    TResult? Function(String authToken, UserModel user)? newUserLogin,
    TResult? Function(UserModel user, String authToken)? completeProfile,
    TResult? Function(UserModel user, String authToken)? authenticatUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? sessionExpired,
  }) {
    return logoutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkExisting,
    TResult Function(String authToken, UserModel user)? newUserLogin,
    TResult Function(UserModel user, String authToken)? completeProfile,
    TResult Function(UserModel user, String authToken)? authenticatUser,
    TResult Function()? logoutRequested,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckExisting value) checkExisting,
    required TResult Function(_NewUserLogin value) newUserLogin,
    required TResult Function(_CompleteProfile value) completeProfile,
    required TResult Function(_AuthenticateUser value) authenticatUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_SessionExpired value) sessionExpired,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckExisting value)? checkExisting,
    TResult? Function(_NewUserLogin value)? newUserLogin,
    TResult? Function(_CompleteProfile value)? completeProfile,
    TResult? Function(_AuthenticateUser value)? authenticatUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_SessionExpired value)? sessionExpired,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckExisting value)? checkExisting,
    TResult Function(_NewUserLogin value)? newUserLogin,
    TResult Function(_CompleteProfile value)? completeProfile,
    TResult Function(_AuthenticateUser value)? authenticatUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_SessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class _LogoutRequested implements AuthenticationEvent {
  const factory _LogoutRequested() = _$LogoutRequestedImpl;
}

/// @nodoc
abstract class _$$SessionExpiredImplCopyWith<$Res> {
  factory _$$SessionExpiredImplCopyWith(_$SessionExpiredImpl value,
          $Res Function(_$SessionExpiredImpl) then) =
      __$$SessionExpiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionExpiredImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$SessionExpiredImpl>
    implements _$$SessionExpiredImplCopyWith<$Res> {
  __$$SessionExpiredImplCopyWithImpl(
      _$SessionExpiredImpl _value, $Res Function(_$SessionExpiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionExpiredImpl implements _SessionExpired {
  const _$SessionExpiredImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.sessionExpired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SessionExpiredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkExisting,
    required TResult Function(String authToken, UserModel user) newUserLogin,
    required TResult Function(UserModel user, String authToken) completeProfile,
    required TResult Function(UserModel user, String authToken) authenticatUser,
    required TResult Function() logoutRequested,
    required TResult Function() sessionExpired,
  }) {
    return sessionExpired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkExisting,
    TResult? Function(String authToken, UserModel user)? newUserLogin,
    TResult? Function(UserModel user, String authToken)? completeProfile,
    TResult? Function(UserModel user, String authToken)? authenticatUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? sessionExpired,
  }) {
    return sessionExpired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkExisting,
    TResult Function(String authToken, UserModel user)? newUserLogin,
    TResult Function(UserModel user, String authToken)? completeProfile,
    TResult Function(UserModel user, String authToken)? authenticatUser,
    TResult Function()? logoutRequested,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckExisting value) checkExisting,
    required TResult Function(_NewUserLogin value) newUserLogin,
    required TResult Function(_CompleteProfile value) completeProfile,
    required TResult Function(_AuthenticateUser value) authenticatUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_SessionExpired value) sessionExpired,
  }) {
    return sessionExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckExisting value)? checkExisting,
    TResult? Function(_NewUserLogin value)? newUserLogin,
    TResult? Function(_CompleteProfile value)? completeProfile,
    TResult? Function(_AuthenticateUser value)? authenticatUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_SessionExpired value)? sessionExpired,
  }) {
    return sessionExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckExisting value)? checkExisting,
    TResult Function(_NewUserLogin value)? newUserLogin,
    TResult Function(_CompleteProfile value)? completeProfile,
    TResult Function(_AuthenticateUser value)? authenticatUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_SessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired(this);
    }
    return orElse();
  }
}

abstract class _SessionExpired implements AuthenticationEvent {
  const factory _SessionExpired() = _$SessionExpiredImpl;
}

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checking,
    required TResult Function() unAuthenticated,
    required TResult Function(UserModel user, String authToken)
        userNeedsProfileDetails,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function()? unAuthenticated,
    TResult? Function(UserModel user, String authToken)?
        userNeedsProfileDetails,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function()? unAuthenticated,
    TResult Function(UserModel user, String authToken)? userNeedsProfileDetails,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Checking value) checking,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
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
  const _$InitialImpl();

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
    required TResult Function() unAuthenticated,
    required TResult Function(UserModel user, String authToken)
        userNeedsProfileDetails,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function()? unAuthenticated,
    TResult? Function(UserModel user, String authToken)?
        userNeedsProfileDetails,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function()? unAuthenticated,
    TResult Function(UserModel user, String authToken)? userNeedsProfileDetails,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(String message)? error,
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
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthenticationState {
  const factory _Initial() = _$InitialImpl;
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
  const _$CheckingImpl();

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
    required TResult Function() unAuthenticated,
    required TResult Function(UserModel user, String authToken)
        userNeedsProfileDetails,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(String message) error,
  }) {
    return checking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function()? unAuthenticated,
    TResult? Function(UserModel user, String authToken)?
        userNeedsProfileDetails,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(String message)? error,
  }) {
    return checking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function()? unAuthenticated,
    TResult Function(UserModel user, String authToken)? userNeedsProfileDetails,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(String message)? error,
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
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
  }) {
    return checking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Error value)? error,
  }) {
    return checking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (checking != null) {
      return checking(this);
    }
    return orElse();
  }
}

abstract class _Checking implements AuthenticationState {
  const factory _Checking() = _$CheckingImpl;
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
  const _$UnAuthenticatedImpl();

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
    required TResult Function() unAuthenticated,
    required TResult Function(UserModel user, String authToken)
        userNeedsProfileDetails,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(String message) error,
  }) {
    return unAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function()? unAuthenticated,
    TResult? Function(UserModel user, String authToken)?
        userNeedsProfileDetails,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(String message)? error,
  }) {
    return unAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function()? unAuthenticated,
    TResult Function(UserModel user, String authToken)? userNeedsProfileDetails,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(String message)? error,
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
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
  }) {
    return unAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Error value)? error,
  }) {
    return unAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _UnAuthenticated implements AuthenticationState {
  const factory _UnAuthenticated() = _$UnAuthenticatedImpl;
}

/// @nodoc
abstract class _$$UserNeedsProfileDetailsImplCopyWith<$Res> {
  factory _$$UserNeedsProfileDetailsImplCopyWith(
          _$UserNeedsProfileDetailsImpl value,
          $Res Function(_$UserNeedsProfileDetailsImpl) then) =
      __$$UserNeedsProfileDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user, String authToken});

  $UserModelCopyWith<$Res> get user;
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
    Object? user = null,
    Object? authToken = null,
  }) {
    return _then(_$UserNeedsProfileDetailsImpl(
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

class _$UserNeedsProfileDetailsImpl implements _UserNeedsProfileDetails {
  const _$UserNeedsProfileDetailsImpl(
      {required this.user, required this.authToken});

  @override
  final UserModel user;
  @override
  final String authToken;

  @override
  String toString() {
    return 'AuthenticationState.userNeedsProfileDetails(user: $user, authToken: $authToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNeedsProfileDetailsImpl &&
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
  _$$UserNeedsProfileDetailsImplCopyWith<_$UserNeedsProfileDetailsImpl>
      get copyWith => __$$UserNeedsProfileDetailsImplCopyWithImpl<
          _$UserNeedsProfileDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checking,
    required TResult Function() unAuthenticated,
    required TResult Function(UserModel user, String authToken)
        userNeedsProfileDetails,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(String message) error,
  }) {
    return userNeedsProfileDetails(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function()? unAuthenticated,
    TResult? Function(UserModel user, String authToken)?
        userNeedsProfileDetails,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(String message)? error,
  }) {
    return userNeedsProfileDetails?.call(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function()? unAuthenticated,
    TResult Function(UserModel user, String authToken)? userNeedsProfileDetails,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (userNeedsProfileDetails != null) {
      return userNeedsProfileDetails(user, authToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Checking value) checking,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
  }) {
    return userNeedsProfileDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Error value)? error,
  }) {
    return userNeedsProfileDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (userNeedsProfileDetails != null) {
      return userNeedsProfileDetails(this);
    }
    return orElse();
  }
}

abstract class _UserNeedsProfileDetails implements AuthenticationState {
  const factory _UserNeedsProfileDetails(
      {required final UserModel user,
      required final String authToken}) = _$UserNeedsProfileDetailsImpl;

  UserModel get user;
  String get authToken;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserNeedsProfileDetailsImplCopyWith<_$UserNeedsProfileDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
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
  const _$UserLoggedInImpl({required this.user, required this.authToken});

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
    required TResult Function() unAuthenticated,
    required TResult Function(UserModel user, String authToken)
        userNeedsProfileDetails,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(String message) error,
  }) {
    return userLoggedIn(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function()? unAuthenticated,
    TResult? Function(UserModel user, String authToken)?
        userNeedsProfileDetails,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(String message)? error,
  }) {
    return userLoggedIn?.call(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function()? unAuthenticated,
    TResult Function(UserModel user, String authToken)? userNeedsProfileDetails,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(String message)? error,
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
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
  }) {
    return userLoggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Error value)? error,
  }) {
    return userLoggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (userLoggedIn != null) {
      return userLoggedIn(this);
    }
    return orElse();
  }
}

abstract class _UserLoggedIn implements AuthenticationState {
  const factory _UserLoggedIn(
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
  const _$UserAuthenticatedImpl({required this.user, required this.authToken});

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
    required TResult Function() unAuthenticated,
    required TResult Function(UserModel user, String authToken)
        userNeedsProfileDetails,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(String message) error,
  }) {
    return userAuthenticated(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function()? unAuthenticated,
    TResult? Function(UserModel user, String authToken)?
        userNeedsProfileDetails,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(String message)? error,
  }) {
    return userAuthenticated?.call(user, authToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function()? unAuthenticated,
    TResult Function(UserModel user, String authToken)? userNeedsProfileDetails,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(String message)? error,
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
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
  }) {
    return userAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Error value)? error,
  }) {
    return userAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (userAuthenticated != null) {
      return userAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _UserAuthenticated implements AuthenticationState {
  const factory _UserAuthenticated(
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
  const _$LoggedOutImpl();

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
    required TResult Function() unAuthenticated,
    required TResult Function(UserModel user, String authToken)
        userNeedsProfileDetails,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(String message) error,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function()? unAuthenticated,
    TResult? Function(UserModel user, String authToken)?
        userNeedsProfileDetails,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(String message)? error,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function()? unAuthenticated,
    TResult Function(UserModel user, String authToken)? userNeedsProfileDetails,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(String message)? error,
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
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Error value)? error,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class _LoggedOut implements AuthenticationState {
  const factory _LoggedOut() = _$LoggedOutImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthenticationState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checking,
    required TResult Function() unAuthenticated,
    required TResult Function(UserModel user, String authToken)
        userNeedsProfileDetails,
    required TResult Function(UserModel user, String authToken) userLoggedIn,
    required TResult Function(UserModel user, String authToken)
        userAuthenticated,
    required TResult Function() loggedOut,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checking,
    TResult? Function()? unAuthenticated,
    TResult? Function(UserModel user, String authToken)?
        userNeedsProfileDetails,
    TResult? Function(UserModel user, String authToken)? userLoggedIn,
    TResult? Function(UserModel user, String authToken)? userAuthenticated,
    TResult? Function()? loggedOut,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checking,
    TResult Function()? unAuthenticated,
    TResult Function(UserModel user, String authToken)? userNeedsProfileDetails,
    TResult Function(UserModel user, String authToken)? userLoggedIn,
    TResult Function(UserModel user, String authToken)? userAuthenticated,
    TResult Function()? loggedOut,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Checking value) checking,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_UserNeedsProfileDetails value)
        userNeedsProfileDetails,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserAuthenticated value) userAuthenticated,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Checking value)? checking,
    TResult? Function(_UnAuthenticated value)? unAuthenticated,
    TResult? Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserAuthenticated value)? userAuthenticated,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Checking value)? checking,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_UserNeedsProfileDetails value)? userNeedsProfileDetails,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserAuthenticated value)? userAuthenticated,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthenticationState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

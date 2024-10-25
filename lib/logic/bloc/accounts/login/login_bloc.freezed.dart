// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  UserType get userType => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  int get attempts => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserType userType, String phone, int attempts)
        startLogin,
    required TResult Function(
            UserType userType, String phone, String otp, int attempts)
        verifyLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserType userType, String phone, int attempts)?
        startLogin,
    TResult? Function(
            UserType userType, String phone, String otp, int attempts)?
        verifyLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserType userType, String phone, int attempts)? startLogin,
    TResult Function(UserType userType, String phone, String otp, int attempts)?
        verifyLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartLogin value) startLogin,
    required TResult Function(_VerifyLogin value) verifyLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartLogin value)? startLogin,
    TResult? Function(_VerifyLogin value)? verifyLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartLogin value)? startLogin,
    TResult Function(_VerifyLogin value)? verifyLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginEventCopyWith<LoginEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
  @useResult
  $Res call({UserType userType, String phone, int attempts});
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userType = null,
    Object? phone = null,
    Object? attempts = null,
  }) {
    return _then(_value.copyWith(
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartLoginImplCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory _$$StartLoginImplCopyWith(
          _$StartLoginImpl value, $Res Function(_$StartLoginImpl) then) =
      __$$StartLoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserType userType, String phone, int attempts});
}

/// @nodoc
class __$$StartLoginImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$StartLoginImpl>
    implements _$$StartLoginImplCopyWith<$Res> {
  __$$StartLoginImplCopyWithImpl(
      _$StartLoginImpl _value, $Res Function(_$StartLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userType = null,
    Object? phone = null,
    Object? attempts = null,
  }) {
    return _then(_$StartLoginImpl(
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StartLoginImpl implements _StartLogin {
  const _$StartLoginImpl(
      {required this.userType, required this.phone, required this.attempts});

  @override
  final UserType userType;
  @override
  final String phone;
  @override
  final int attempts;

  @override
  String toString() {
    return 'LoginEvent.startLogin(userType: $userType, phone: $phone, attempts: $attempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartLoginImpl &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.attempts, attempts) ||
                other.attempts == attempts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userType, phone, attempts);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartLoginImplCopyWith<_$StartLoginImpl> get copyWith =>
      __$$StartLoginImplCopyWithImpl<_$StartLoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserType userType, String phone, int attempts)
        startLogin,
    required TResult Function(
            UserType userType, String phone, String otp, int attempts)
        verifyLogin,
  }) {
    return startLogin(userType, phone, attempts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserType userType, String phone, int attempts)?
        startLogin,
    TResult? Function(
            UserType userType, String phone, String otp, int attempts)?
        verifyLogin,
  }) {
    return startLogin?.call(userType, phone, attempts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserType userType, String phone, int attempts)? startLogin,
    TResult Function(UserType userType, String phone, String otp, int attempts)?
        verifyLogin,
    required TResult orElse(),
  }) {
    if (startLogin != null) {
      return startLogin(userType, phone, attempts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartLogin value) startLogin,
    required TResult Function(_VerifyLogin value) verifyLogin,
  }) {
    return startLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartLogin value)? startLogin,
    TResult? Function(_VerifyLogin value)? verifyLogin,
  }) {
    return startLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartLogin value)? startLogin,
    TResult Function(_VerifyLogin value)? verifyLogin,
    required TResult orElse(),
  }) {
    if (startLogin != null) {
      return startLogin(this);
    }
    return orElse();
  }
}

abstract class _StartLogin implements LoginEvent {
  const factory _StartLogin(
      {required final UserType userType,
      required final String phone,
      required final int attempts}) = _$StartLoginImpl;

  @override
  UserType get userType;
  @override
  String get phone;
  @override
  int get attempts;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartLoginImplCopyWith<_$StartLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyLoginImplCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory _$$VerifyLoginImplCopyWith(
          _$VerifyLoginImpl value, $Res Function(_$VerifyLoginImpl) then) =
      __$$VerifyLoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserType userType, String phone, String otp, int attempts});
}

/// @nodoc
class __$$VerifyLoginImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$VerifyLoginImpl>
    implements _$$VerifyLoginImplCopyWith<$Res> {
  __$$VerifyLoginImplCopyWithImpl(
      _$VerifyLoginImpl _value, $Res Function(_$VerifyLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userType = null,
    Object? phone = null,
    Object? otp = null,
    Object? attempts = null,
  }) {
    return _then(_$VerifyLoginImpl(
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$VerifyLoginImpl implements _VerifyLogin {
  const _$VerifyLoginImpl(
      {required this.userType,
      required this.phone,
      required this.otp,
      required this.attempts});

  @override
  final UserType userType;
  @override
  final String phone;
  @override
  final String otp;
  @override
  final int attempts;

  @override
  String toString() {
    return 'LoginEvent.verifyLogin(userType: $userType, phone: $phone, otp: $otp, attempts: $attempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyLoginImpl &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.attempts, attempts) ||
                other.attempts == attempts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userType, phone, otp, attempts);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyLoginImplCopyWith<_$VerifyLoginImpl> get copyWith =>
      __$$VerifyLoginImplCopyWithImpl<_$VerifyLoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserType userType, String phone, int attempts)
        startLogin,
    required TResult Function(
            UserType userType, String phone, String otp, int attempts)
        verifyLogin,
  }) {
    return verifyLogin(userType, phone, otp, attempts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserType userType, String phone, int attempts)?
        startLogin,
    TResult? Function(
            UserType userType, String phone, String otp, int attempts)?
        verifyLogin,
  }) {
    return verifyLogin?.call(userType, phone, otp, attempts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserType userType, String phone, int attempts)? startLogin,
    TResult Function(UserType userType, String phone, String otp, int attempts)?
        verifyLogin,
    required TResult orElse(),
  }) {
    if (verifyLogin != null) {
      return verifyLogin(userType, phone, otp, attempts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartLogin value) startLogin,
    required TResult Function(_VerifyLogin value) verifyLogin,
  }) {
    return verifyLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartLogin value)? startLogin,
    TResult? Function(_VerifyLogin value)? verifyLogin,
  }) {
    return verifyLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartLogin value)? startLogin,
    TResult Function(_VerifyLogin value)? verifyLogin,
    required TResult orElse(),
  }) {
    if (verifyLogin != null) {
      return verifyLogin(this);
    }
    return orElse();
  }
}

abstract class _VerifyLogin implements LoginEvent {
  const factory _VerifyLogin(
      {required final UserType userType,
      required final String phone,
      required final String otp,
      required final int attempts}) = _$VerifyLoginImpl;

  @override
  UserType get userType;
  @override
  String get phone;
  String get otp;
  @override
  int get attempts;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyLoginImplCopyWith<_$VerifyLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(UserType userType, String phone, int attempts)
        loginStarted,
    required TResult Function(UserType userType, String phone, int attempts)
        verificationStarted,
    required TResult Function(
            String authToken, UserType userType, UserModel user)
        loginUserSuccess,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult? Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult? Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_LoginStarted value) loginStarted,
    required TResult Function(_VerificationStarted value) verificationStarted,
    required TResult Function(_LoginUserSucces value) loginUserSuccess,
    required TResult Function(_LoginError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_LoginStarted value)? loginStarted,
    TResult? Function(_VerificationStarted value)? verificationStarted,
    TResult? Function(_LoginUserSucces value)? loginUserSuccess,
    TResult? Function(_LoginError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_LoginStarted value)? loginStarted,
    TResult Function(_VerificationStarted value)? verificationStarted,
    TResult Function(_LoginUserSucces value)? loginUserSuccess,
    TResult Function(_LoginError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
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
    extends _$LoginStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LoginState.initial()';
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
    required TResult Function() inProgress,
    required TResult Function(UserType userType, String phone, int attempts)
        loginStarted,
    required TResult Function(UserType userType, String phone, int attempts)
        verificationStarted,
    required TResult Function(
            String authToken, UserType userType, UserModel user)
        loginUserSuccess,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult? Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult? Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
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
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_LoginStarted value) loginStarted,
    required TResult Function(_VerificationStarted value) verificationStarted,
    required TResult Function(_LoginUserSucces value) loginUserSuccess,
    required TResult Function(_LoginError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_LoginStarted value)? loginStarted,
    TResult? Function(_VerificationStarted value)? verificationStarted,
    TResult? Function(_LoginUserSucces value)? loginUserSuccess,
    TResult? Function(_LoginError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_LoginStarted value)? loginStarted,
    TResult Function(_VerificationStarted value)? verificationStarted,
    TResult Function(_LoginUserSucces value)? loginUserSuccess,
    TResult Function(_LoginError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoginState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$InProgressImplCopyWith<$Res> {
  factory _$$InProgressImplCopyWith(
          _$InProgressImpl value, $Res Function(_$InProgressImpl) then) =
      __$$InProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InProgressImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$InProgressImpl>
    implements _$$InProgressImplCopyWith<$Res> {
  __$$InProgressImplCopyWithImpl(
      _$InProgressImpl _value, $Res Function(_$InProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InProgressImpl implements _InProgress {
  const _$InProgressImpl();

  @override
  String toString() {
    return 'LoginState.inProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(UserType userType, String phone, int attempts)
        loginStarted,
    required TResult Function(UserType userType, String phone, int attempts)
        verificationStarted,
    required TResult Function(
            String authToken, UserType userType, UserModel user)
        loginUserSuccess,
    required TResult Function(String message) error,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult? Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult? Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
    TResult? Function(String message)? error,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_LoginStarted value) loginStarted,
    required TResult Function(_VerificationStarted value) verificationStarted,
    required TResult Function(_LoginUserSucces value) loginUserSuccess,
    required TResult Function(_LoginError value) error,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_LoginStarted value)? loginStarted,
    TResult? Function(_VerificationStarted value)? verificationStarted,
    TResult? Function(_LoginUserSucces value)? loginUserSuccess,
    TResult? Function(_LoginError value)? error,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_LoginStarted value)? loginStarted,
    TResult Function(_VerificationStarted value)? verificationStarted,
    TResult Function(_LoginUserSucces value)? loginUserSuccess,
    TResult Function(_LoginError value)? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _InProgress implements LoginState {
  const factory _InProgress() = _$InProgressImpl;
}

/// @nodoc
abstract class _$$LoginStartedImplCopyWith<$Res> {
  factory _$$LoginStartedImplCopyWith(
          _$LoginStartedImpl value, $Res Function(_$LoginStartedImpl) then) =
      __$$LoginStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserType userType, String phone, int attempts});
}

/// @nodoc
class __$$LoginStartedImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStartedImpl>
    implements _$$LoginStartedImplCopyWith<$Res> {
  __$$LoginStartedImplCopyWithImpl(
      _$LoginStartedImpl _value, $Res Function(_$LoginStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userType = null,
    Object? phone = null,
    Object? attempts = null,
  }) {
    return _then(_$LoginStartedImpl(
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoginStartedImpl implements _LoginStarted {
  const _$LoginStartedImpl(
      {required this.userType, required this.phone, required this.attempts});

  @override
  final UserType userType;
  @override
  final String phone;
  @override
  final int attempts;

  @override
  String toString() {
    return 'LoginState.loginStarted(userType: $userType, phone: $phone, attempts: $attempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStartedImpl &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.attempts, attempts) ||
                other.attempts == attempts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userType, phone, attempts);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStartedImplCopyWith<_$LoginStartedImpl> get copyWith =>
      __$$LoginStartedImplCopyWithImpl<_$LoginStartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(UserType userType, String phone, int attempts)
        loginStarted,
    required TResult Function(UserType userType, String phone, int attempts)
        verificationStarted,
    required TResult Function(
            String authToken, UserType userType, UserModel user)
        loginUserSuccess,
    required TResult Function(String message) error,
  }) {
    return loginStarted(userType, phone, attempts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult? Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult? Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
    TResult? Function(String message)? error,
  }) {
    return loginStarted?.call(userType, phone, attempts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loginStarted != null) {
      return loginStarted(userType, phone, attempts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_LoginStarted value) loginStarted,
    required TResult Function(_VerificationStarted value) verificationStarted,
    required TResult Function(_LoginUserSucces value) loginUserSuccess,
    required TResult Function(_LoginError value) error,
  }) {
    return loginStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_LoginStarted value)? loginStarted,
    TResult? Function(_VerificationStarted value)? verificationStarted,
    TResult? Function(_LoginUserSucces value)? loginUserSuccess,
    TResult? Function(_LoginError value)? error,
  }) {
    return loginStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_LoginStarted value)? loginStarted,
    TResult Function(_VerificationStarted value)? verificationStarted,
    TResult Function(_LoginUserSucces value)? loginUserSuccess,
    TResult Function(_LoginError value)? error,
    required TResult orElse(),
  }) {
    if (loginStarted != null) {
      return loginStarted(this);
    }
    return orElse();
  }
}

abstract class _LoginStarted implements LoginState {
  const factory _LoginStarted(
      {required final UserType userType,
      required final String phone,
      required final int attempts}) = _$LoginStartedImpl;

  UserType get userType;
  String get phone;
  int get attempts;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginStartedImplCopyWith<_$LoginStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerificationStartedImplCopyWith<$Res> {
  factory _$$VerificationStartedImplCopyWith(_$VerificationStartedImpl value,
          $Res Function(_$VerificationStartedImpl) then) =
      __$$VerificationStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserType userType, String phone, int attempts});
}

/// @nodoc
class __$$VerificationStartedImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$VerificationStartedImpl>
    implements _$$VerificationStartedImplCopyWith<$Res> {
  __$$VerificationStartedImplCopyWithImpl(_$VerificationStartedImpl _value,
      $Res Function(_$VerificationStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userType = null,
    Object? phone = null,
    Object? attempts = null,
  }) {
    return _then(_$VerificationStartedImpl(
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$VerificationStartedImpl implements _VerificationStarted {
  const _$VerificationStartedImpl(
      {required this.userType, required this.phone, required this.attempts});

  @override
  final UserType userType;
  @override
  final String phone;
  @override
  final int attempts;

  @override
  String toString() {
    return 'LoginState.verificationStarted(userType: $userType, phone: $phone, attempts: $attempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationStartedImpl &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.attempts, attempts) ||
                other.attempts == attempts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userType, phone, attempts);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationStartedImplCopyWith<_$VerificationStartedImpl> get copyWith =>
      __$$VerificationStartedImplCopyWithImpl<_$VerificationStartedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(UserType userType, String phone, int attempts)
        loginStarted,
    required TResult Function(UserType userType, String phone, int attempts)
        verificationStarted,
    required TResult Function(
            String authToken, UserType userType, UserModel user)
        loginUserSuccess,
    required TResult Function(String message) error,
  }) {
    return verificationStarted(userType, phone, attempts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult? Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult? Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
    TResult? Function(String message)? error,
  }) {
    return verificationStarted?.call(userType, phone, attempts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (verificationStarted != null) {
      return verificationStarted(userType, phone, attempts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_LoginStarted value) loginStarted,
    required TResult Function(_VerificationStarted value) verificationStarted,
    required TResult Function(_LoginUserSucces value) loginUserSuccess,
    required TResult Function(_LoginError value) error,
  }) {
    return verificationStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_LoginStarted value)? loginStarted,
    TResult? Function(_VerificationStarted value)? verificationStarted,
    TResult? Function(_LoginUserSucces value)? loginUserSuccess,
    TResult? Function(_LoginError value)? error,
  }) {
    return verificationStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_LoginStarted value)? loginStarted,
    TResult Function(_VerificationStarted value)? verificationStarted,
    TResult Function(_LoginUserSucces value)? loginUserSuccess,
    TResult Function(_LoginError value)? error,
    required TResult orElse(),
  }) {
    if (verificationStarted != null) {
      return verificationStarted(this);
    }
    return orElse();
  }
}

abstract class _VerificationStarted implements LoginState {
  const factory _VerificationStarted(
      {required final UserType userType,
      required final String phone,
      required final int attempts}) = _$VerificationStartedImpl;

  UserType get userType;
  String get phone;
  int get attempts;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationStartedImplCopyWith<_$VerificationStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginUserSuccesImplCopyWith<$Res> {
  factory _$$LoginUserSuccesImplCopyWith(_$LoginUserSuccesImpl value,
          $Res Function(_$LoginUserSuccesImpl) then) =
      __$$LoginUserSuccesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String authToken, UserType userType, UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginUserSuccesImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginUserSuccesImpl>
    implements _$$LoginUserSuccesImplCopyWith<$Res> {
  __$$LoginUserSuccesImplCopyWithImpl(
      _$LoginUserSuccesImpl _value, $Res Function(_$LoginUserSuccesImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authToken = null,
    Object? userType = null,
    Object? user = null,
  }) {
    return _then(_$LoginUserSuccesImpl(
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  /// Create a copy of LoginState
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

class _$LoginUserSuccesImpl implements _LoginUserSucces {
  const _$LoginUserSuccesImpl(
      {required this.authToken, required this.userType, required this.user});

  @override
  final String authToken;
  @override
  final UserType userType;
  @override
  final UserModel user;

  @override
  String toString() {
    return 'LoginState.loginUserSuccess(authToken: $authToken, userType: $userType, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginUserSuccesImpl &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authToken, userType, user);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginUserSuccesImplCopyWith<_$LoginUserSuccesImpl> get copyWith =>
      __$$LoginUserSuccesImplCopyWithImpl<_$LoginUserSuccesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(UserType userType, String phone, int attempts)
        loginStarted,
    required TResult Function(UserType userType, String phone, int attempts)
        verificationStarted,
    required TResult Function(
            String authToken, UserType userType, UserModel user)
        loginUserSuccess,
    required TResult Function(String message) error,
  }) {
    return loginUserSuccess(authToken, userType, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult? Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult? Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
    TResult? Function(String message)? error,
  }) {
    return loginUserSuccess?.call(authToken, userType, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loginUserSuccess != null) {
      return loginUserSuccess(authToken, userType, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_LoginStarted value) loginStarted,
    required TResult Function(_VerificationStarted value) verificationStarted,
    required TResult Function(_LoginUserSucces value) loginUserSuccess,
    required TResult Function(_LoginError value) error,
  }) {
    return loginUserSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_LoginStarted value)? loginStarted,
    TResult? Function(_VerificationStarted value)? verificationStarted,
    TResult? Function(_LoginUserSucces value)? loginUserSuccess,
    TResult? Function(_LoginError value)? error,
  }) {
    return loginUserSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_LoginStarted value)? loginStarted,
    TResult Function(_VerificationStarted value)? verificationStarted,
    TResult Function(_LoginUserSucces value)? loginUserSuccess,
    TResult Function(_LoginError value)? error,
    required TResult orElse(),
  }) {
    if (loginUserSuccess != null) {
      return loginUserSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoginUserSucces implements LoginState {
  const factory _LoginUserSucces(
      {required final String authToken,
      required final UserType userType,
      required final UserModel user}) = _$LoginUserSuccesImpl;

  String get authToken;
  UserType get userType;
  UserModel get user;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginUserSuccesImplCopyWith<_$LoginUserSuccesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginErrorImplCopyWith<$Res> {
  factory _$$LoginErrorImplCopyWith(
          _$LoginErrorImpl value, $Res Function(_$LoginErrorImpl) then) =
      __$$LoginErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LoginErrorImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginErrorImpl>
    implements _$$LoginErrorImplCopyWith<$Res> {
  __$$LoginErrorImplCopyWithImpl(
      _$LoginErrorImpl _value, $Res Function(_$LoginErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LoginErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginErrorImpl implements _LoginError {
  const _$LoginErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LoginState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginErrorImplCopyWith<_$LoginErrorImpl> get copyWith =>
      __$$LoginErrorImplCopyWithImpl<_$LoginErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(UserType userType, String phone, int attempts)
        loginStarted,
    required TResult Function(UserType userType, String phone, int attempts)
        verificationStarted,
    required TResult Function(
            String authToken, UserType userType, UserModel user)
        loginUserSuccess,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult? Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult? Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(UserType userType, String phone, int attempts)?
        loginStarted,
    TResult Function(UserType userType, String phone, int attempts)?
        verificationStarted,
    TResult Function(String authToken, UserType userType, UserModel user)?
        loginUserSuccess,
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
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_LoginStarted value) loginStarted,
    required TResult Function(_VerificationStarted value) verificationStarted,
    required TResult Function(_LoginUserSucces value) loginUserSuccess,
    required TResult Function(_LoginError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_LoginStarted value)? loginStarted,
    TResult? Function(_VerificationStarted value)? verificationStarted,
    TResult? Function(_LoginUserSucces value)? loginUserSuccess,
    TResult? Function(_LoginError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_LoginStarted value)? loginStarted,
    TResult Function(_VerificationStarted value)? verificationStarted,
    TResult Function(_LoginUserSucces value)? loginUserSuccess,
    TResult Function(_LoginError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _LoginError implements LoginState {
  const factory _LoginError(final String message) = _$LoginErrorImpl;

  String get message;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginErrorImplCopyWith<_$LoginErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

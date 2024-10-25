// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loggedin_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoggedInUserModel _$LoggedInUserModelFromJson(Map<String, dynamic> json) {
  return _LoggedInUserModel.fromJson(json);
}

/// @nodoc
mixin _$LoggedInUserModel {
  String get accessToken => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;

  /// Serializes this LoggedInUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoggedInUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoggedInUserModelCopyWith<LoggedInUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggedInUserModelCopyWith<$Res> {
  factory $LoggedInUserModelCopyWith(
          LoggedInUserModel value, $Res Function(LoggedInUserModel) then) =
      _$LoggedInUserModelCopyWithImpl<$Res, LoggedInUserModel>;
  @useResult
  $Res call({String accessToken, UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$LoggedInUserModelCopyWithImpl<$Res, $Val extends LoggedInUserModel>
    implements $LoggedInUserModelCopyWith<$Res> {
  _$LoggedInUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoggedInUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ) as $Val);
  }

  /// Create a copy of LoggedInUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoggedInUserModelImplCopyWith<$Res>
    implements $LoggedInUserModelCopyWith<$Res> {
  factory _$$LoggedInUserModelImplCopyWith(_$LoggedInUserModelImpl value,
          $Res Function(_$LoggedInUserModelImpl) then) =
      __$$LoggedInUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, UserModel user});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoggedInUserModelImplCopyWithImpl<$Res>
    extends _$LoggedInUserModelCopyWithImpl<$Res, _$LoggedInUserModelImpl>
    implements _$$LoggedInUserModelImplCopyWith<$Res> {
  __$$LoggedInUserModelImplCopyWithImpl(_$LoggedInUserModelImpl _value,
      $Res Function(_$LoggedInUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoggedInUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? user = null,
  }) {
    return _then(_$LoggedInUserModelImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoggedInUserModelImpl implements _LoggedInUserModel {
  const _$LoggedInUserModelImpl(
      {required this.accessToken, required this.user});

  factory _$LoggedInUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoggedInUserModelImplFromJson(json);

  @override
  final String accessToken;
  @override
  final UserModel user;

  @override
  String toString() {
    return 'LoggedInUserModel(accessToken: $accessToken, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggedInUserModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, user);

  /// Create a copy of LoggedInUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedInUserModelImplCopyWith<_$LoggedInUserModelImpl> get copyWith =>
      __$$LoggedInUserModelImplCopyWithImpl<_$LoggedInUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoggedInUserModelImplToJson(
      this,
    );
  }
}

abstract class _LoggedInUserModel implements LoggedInUserModel {
  const factory _LoggedInUserModel(
      {required final String accessToken,
      required final UserModel user}) = _$LoggedInUserModelImpl;

  factory _LoggedInUserModel.fromJson(Map<String, dynamic> json) =
      _$LoggedInUserModelImpl.fromJson;

  @override
  String get accessToken;
  @override
  UserModel get user;

  /// Create a copy of LoggedInUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoggedInUserModelImplCopyWith<_$LoggedInUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

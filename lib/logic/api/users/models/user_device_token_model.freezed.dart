// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDeviceTokenModel _$UserDeviceTokenModelFromJson(Map<String, dynamic> json) {
  return _UserDeviceTokenModel.fromJson(json);
}

/// @nodoc
mixin _$UserDeviceTokenModel {
  String get deviceToken => throw _privateConstructorUsedError;

  /// Serializes this UserDeviceTokenModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDeviceTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDeviceTokenModelCopyWith<UserDeviceTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDeviceTokenModelCopyWith<$Res> {
  factory $UserDeviceTokenModelCopyWith(UserDeviceTokenModel value,
          $Res Function(UserDeviceTokenModel) then) =
      _$UserDeviceTokenModelCopyWithImpl<$Res, UserDeviceTokenModel>;
  @useResult
  $Res call({String deviceToken});
}

/// @nodoc
class _$UserDeviceTokenModelCopyWithImpl<$Res,
        $Val extends UserDeviceTokenModel>
    implements $UserDeviceTokenModelCopyWith<$Res> {
  _$UserDeviceTokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDeviceTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceToken = null,
  }) {
    return _then(_value.copyWith(
      deviceToken: null == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDeviceTokenModelImplCopyWith<$Res>
    implements $UserDeviceTokenModelCopyWith<$Res> {
  factory _$$UserDeviceTokenModelImplCopyWith(_$UserDeviceTokenModelImpl value,
          $Res Function(_$UserDeviceTokenModelImpl) then) =
      __$$UserDeviceTokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceToken});
}

/// @nodoc
class __$$UserDeviceTokenModelImplCopyWithImpl<$Res>
    extends _$UserDeviceTokenModelCopyWithImpl<$Res, _$UserDeviceTokenModelImpl>
    implements _$$UserDeviceTokenModelImplCopyWith<$Res> {
  __$$UserDeviceTokenModelImplCopyWithImpl(_$UserDeviceTokenModelImpl _value,
      $Res Function(_$UserDeviceTokenModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDeviceTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceToken = null,
  }) {
    return _then(_$UserDeviceTokenModelImpl(
      deviceToken: null == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDeviceTokenModelImpl implements _UserDeviceTokenModel {
  const _$UserDeviceTokenModelImpl({required this.deviceToken});

  factory _$UserDeviceTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDeviceTokenModelImplFromJson(json);

  @override
  final String deviceToken;

  @override
  String toString() {
    return 'UserDeviceTokenModel(deviceToken: $deviceToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDeviceTokenModelImpl &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceToken);

  /// Create a copy of UserDeviceTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDeviceTokenModelImplCopyWith<_$UserDeviceTokenModelImpl>
      get copyWith =>
          __$$UserDeviceTokenModelImplCopyWithImpl<_$UserDeviceTokenModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDeviceTokenModelImplToJson(
      this,
    );
  }
}

abstract class _UserDeviceTokenModel implements UserDeviceTokenModel {
  const factory _UserDeviceTokenModel({required final String deviceToken}) =
      _$UserDeviceTokenModelImpl;

  factory _UserDeviceTokenModel.fromJson(Map<String, dynamic> json) =
      _$UserDeviceTokenModelImpl.fromJson;

  @override
  String get deviceToken;

  /// Create a copy of UserDeviceTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDeviceTokenModelImplCopyWith<_$UserDeviceTokenModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

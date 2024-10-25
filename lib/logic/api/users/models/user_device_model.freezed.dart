// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDeviceModel _$UserDeviceModelFromJson(Map<String, dynamic> json) {
  return _UserDeviceModel.fromJson(json);
}

/// @nodoc
mixin _$UserDeviceModel {
  String get id => throw _privateConstructorUsedError;
  String get deviceToken => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserDeviceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDeviceModelCopyWith<UserDeviceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDeviceModelCopyWith<$Res> {
  factory $UserDeviceModelCopyWith(
          UserDeviceModel value, $Res Function(UserDeviceModel) then) =
      _$UserDeviceModelCopyWithImpl<$Res, UserDeviceModel>;
  @useResult
  $Res call(
      {String id,
      String deviceToken,
      String platform,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserDeviceModelCopyWithImpl<$Res, $Val extends UserDeviceModel>
    implements $UserDeviceModelCopyWith<$Res> {
  _$UserDeviceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceToken = null,
    Object? platform = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceToken: null == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDeviceModelImplCopyWith<$Res>
    implements $UserDeviceModelCopyWith<$Res> {
  factory _$$UserDeviceModelImplCopyWith(_$UserDeviceModelImpl value,
          $Res Function(_$UserDeviceModelImpl) then) =
      __$$UserDeviceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String deviceToken,
      String platform,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$UserDeviceModelImplCopyWithImpl<$Res>
    extends _$UserDeviceModelCopyWithImpl<$Res, _$UserDeviceModelImpl>
    implements _$$UserDeviceModelImplCopyWith<$Res> {
  __$$UserDeviceModelImplCopyWithImpl(
      _$UserDeviceModelImpl _value, $Res Function(_$UserDeviceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceToken = null,
    Object? platform = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserDeviceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceToken: null == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDeviceModelImpl implements _UserDeviceModel {
  const _$UserDeviceModelImpl(
      {required this.id,
      required this.deviceToken,
      required this.platform,
      required this.createdAt,
      required this.updatedAt});

  factory _$UserDeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDeviceModelImplFromJson(json);

  @override
  final String id;
  @override
  final String deviceToken;
  @override
  final String platform;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserDeviceModel(id: $id, deviceToken: $deviceToken, platform: $platform, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDeviceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, deviceToken, platform, createdAt, updatedAt);

  /// Create a copy of UserDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDeviceModelImplCopyWith<_$UserDeviceModelImpl> get copyWith =>
      __$$UserDeviceModelImplCopyWithImpl<_$UserDeviceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDeviceModelImplToJson(
      this,
    );
  }
}

abstract class _UserDeviceModel implements UserDeviceModel {
  const factory _UserDeviceModel(
      {required final String id,
      required final String deviceToken,
      required final String platform,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$UserDeviceModelImpl;

  factory _UserDeviceModel.fromJson(Map<String, dynamic> json) =
      _$UserDeviceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get deviceToken;
  @override
  String get platform;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of UserDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDeviceModelImplCopyWith<_$UserDeviceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

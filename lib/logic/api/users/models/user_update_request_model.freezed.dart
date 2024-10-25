// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_update_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserUpdateRequestModel _$UserUpdateRequestModelFromJson(
    Map<String, dynamic> json) {
  return _UserUpdateRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UserUpdateRequestModel {
  String get fullName => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;

  /// Serializes this UserUpdateRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserUpdateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserUpdateRequestModelCopyWith<UserUpdateRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserUpdateRequestModelCopyWith<$Res> {
  factory $UserUpdateRequestModelCopyWith(UserUpdateRequestModel value,
          $Res Function(UserUpdateRequestModel) then) =
      _$UserUpdateRequestModelCopyWithImpl<$Res, UserUpdateRequestModel>;
  @useResult
  $Res call({String fullName, String? path});
}

/// @nodoc
class _$UserUpdateRequestModelCopyWithImpl<$Res,
        $Val extends UserUpdateRequestModel>
    implements $UserUpdateRequestModelCopyWith<$Res> {
  _$UserUpdateRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserUpdateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? path = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserUpdateRequestModelImplCopyWith<$Res>
    implements $UserUpdateRequestModelCopyWith<$Res> {
  factory _$$UserUpdateRequestModelImplCopyWith(
          _$UserUpdateRequestModelImpl value,
          $Res Function(_$UserUpdateRequestModelImpl) then) =
      __$$UserUpdateRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fullName, String? path});
}

/// @nodoc
class __$$UserUpdateRequestModelImplCopyWithImpl<$Res>
    extends _$UserUpdateRequestModelCopyWithImpl<$Res,
        _$UserUpdateRequestModelImpl>
    implements _$$UserUpdateRequestModelImplCopyWith<$Res> {
  __$$UserUpdateRequestModelImplCopyWithImpl(
      _$UserUpdateRequestModelImpl _value,
      $Res Function(_$UserUpdateRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserUpdateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? path = freezed,
  }) {
    return _then(_$UserUpdateRequestModelImpl(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserUpdateRequestModelImpl implements _UserUpdateRequestModel {
  const _$UserUpdateRequestModelImpl({required this.fullName, this.path});

  factory _$UserUpdateRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserUpdateRequestModelImplFromJson(json);

  @override
  final String fullName;
  @override
  final String? path;

  @override
  String toString() {
    return 'UserUpdateRequestModel(fullName: $fullName, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUpdateRequestModelImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, path);

  /// Create a copy of UserUpdateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUpdateRequestModelImplCopyWith<_$UserUpdateRequestModelImpl>
      get copyWith => __$$UserUpdateRequestModelImplCopyWithImpl<
          _$UserUpdateRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserUpdateRequestModelImplToJson(
      this,
    );
  }
}

abstract class _UserUpdateRequestModel implements UserUpdateRequestModel {
  const factory _UserUpdateRequestModel(
      {required final String fullName,
      final String? path}) = _$UserUpdateRequestModelImpl;

  factory _UserUpdateRequestModel.fromJson(Map<String, dynamic> json) =
      _$UserUpdateRequestModelImpl.fromJson;

  @override
  String get fullName;
  @override
  String? get path;

  /// Create a copy of UserUpdateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserUpdateRequestModelImplCopyWith<_$UserUpdateRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

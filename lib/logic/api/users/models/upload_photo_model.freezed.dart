// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_photo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadPhotoModel _$UploadPhotoModelFromJson(Map<String, dynamic> json) {
  return _UploadPhotoModel.fromJson(json);
}

/// @nodoc
mixin _$UploadPhotoModel {
  String get postUrl => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;

  /// Serializes this UploadPhotoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadPhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadPhotoModelCopyWith<UploadPhotoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadPhotoModelCopyWith<$Res> {
  factory $UploadPhotoModelCopyWith(
          UploadPhotoModel value, $Res Function(UploadPhotoModel) then) =
      _$UploadPhotoModelCopyWithImpl<$Res, UploadPhotoModel>;
  @useResult
  $Res call({String postUrl, String path});
}

/// @nodoc
class _$UploadPhotoModelCopyWithImpl<$Res, $Val extends UploadPhotoModel>
    implements $UploadPhotoModelCopyWith<$Res> {
  _$UploadPhotoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadPhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postUrl = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      postUrl: null == postUrl
          ? _value.postUrl
          : postUrl // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadPhotoModelImplCopyWith<$Res>
    implements $UploadPhotoModelCopyWith<$Res> {
  factory _$$UploadPhotoModelImplCopyWith(_$UploadPhotoModelImpl value,
          $Res Function(_$UploadPhotoModelImpl) then) =
      __$$UploadPhotoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String postUrl, String path});
}

/// @nodoc
class __$$UploadPhotoModelImplCopyWithImpl<$Res>
    extends _$UploadPhotoModelCopyWithImpl<$Res, _$UploadPhotoModelImpl>
    implements _$$UploadPhotoModelImplCopyWith<$Res> {
  __$$UploadPhotoModelImplCopyWithImpl(_$UploadPhotoModelImpl _value,
      $Res Function(_$UploadPhotoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadPhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postUrl = null,
    Object? path = null,
  }) {
    return _then(_$UploadPhotoModelImpl(
      postUrl: null == postUrl
          ? _value.postUrl
          : postUrl // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadPhotoModelImpl implements _UploadPhotoModel {
  const _$UploadPhotoModelImpl({required this.postUrl, required this.path});

  factory _$UploadPhotoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadPhotoModelImplFromJson(json);

  @override
  final String postUrl;
  @override
  final String path;

  @override
  String toString() {
    return 'UploadPhotoModel(postUrl: $postUrl, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadPhotoModelImpl &&
            (identical(other.postUrl, postUrl) || other.postUrl == postUrl) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, postUrl, path);

  /// Create a copy of UploadPhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadPhotoModelImplCopyWith<_$UploadPhotoModelImpl> get copyWith =>
      __$$UploadPhotoModelImplCopyWithImpl<_$UploadPhotoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadPhotoModelImplToJson(
      this,
    );
  }
}

abstract class _UploadPhotoModel implements UploadPhotoModel {
  const factory _UploadPhotoModel(
      {required final String postUrl,
      required final String path}) = _$UploadPhotoModelImpl;

  factory _UploadPhotoModel.fromJson(Map<String, dynamic> json) =
      _$UploadPhotoModelImpl.fromJson;

  @override
  String get postUrl;
  @override
  String get path;

  /// Create a copy of UploadPhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadPhotoModelImplCopyWith<_$UploadPhotoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'look.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Look _$LookFromJson(Map<String, dynamic> json) {
  return _Look.fromJson(json);
}

/// @nodoc
mixin _$Look {
  String get id => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get lookImageData => throw _privateConstructorUsedError;
  String get lookWithUserImageData => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  /// Serializes this Look to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Look
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LookCopyWith<Look> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LookCopyWith<$Res> {
  factory $LookCopyWith(Look value, $Res Function(Look) then) =
      _$LookCopyWithImpl<$Res, Look>;
  @useResult
  $Res call(
      {String id,
      List<Item> items,
      String name,
      String description,
      String lookImageData,
      String lookWithUserImageData,
      String userId});
}

/// @nodoc
class _$LookCopyWithImpl<$Res, $Val extends Look>
    implements $LookCopyWith<$Res> {
  _$LookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Look
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? name = null,
    Object? description = null,
    Object? lookImageData = null,
    Object? lookWithUserImageData = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lookImageData: null == lookImageData
          ? _value.lookImageData
          : lookImageData // ignore: cast_nullable_to_non_nullable
              as String,
      lookWithUserImageData: null == lookWithUserImageData
          ? _value.lookWithUserImageData
          : lookWithUserImageData // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LookImplCopyWith<$Res> implements $LookCopyWith<$Res> {
  factory _$$LookImplCopyWith(
          _$LookImpl value, $Res Function(_$LookImpl) then) =
      __$$LookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<Item> items,
      String name,
      String description,
      String lookImageData,
      String lookWithUserImageData,
      String userId});
}

/// @nodoc
class __$$LookImplCopyWithImpl<$Res>
    extends _$LookCopyWithImpl<$Res, _$LookImpl>
    implements _$$LookImplCopyWith<$Res> {
  __$$LookImplCopyWithImpl(_$LookImpl _value, $Res Function(_$LookImpl) _then)
      : super(_value, _then);

  /// Create a copy of Look
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? name = null,
    Object? description = null,
    Object? lookImageData = null,
    Object? lookWithUserImageData = null,
    Object? userId = null,
  }) {
    return _then(_$LookImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lookImageData: null == lookImageData
          ? _value.lookImageData
          : lookImageData // ignore: cast_nullable_to_non_nullable
              as String,
      lookWithUserImageData: null == lookWithUserImageData
          ? _value.lookWithUserImageData
          : lookWithUserImageData // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LookImpl extends _Look {
  const _$LookImpl(
      {required this.id,
      required final List<Item> items,
      required this.name,
      required this.description,
      required this.lookImageData,
      required this.lookWithUserImageData,
      required this.userId})
      : _items = items,
        super._();

  factory _$LookImpl.fromJson(Map<String, dynamic> json) =>
      _$$LookImplFromJson(json);

  @override
  final String id;
  final List<Item> _items;
  @override
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String name;
  @override
  final String description;
  @override
  final String lookImageData;
  @override
  final String lookWithUserImageData;
  @override
  final String userId;

  @override
  String toString() {
    return 'Look(id: $id, items: $items, name: $name, description: $description, lookImageData: $lookImageData, lookWithUserImageData: $lookWithUserImageData, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LookImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lookImageData, lookImageData) ||
                other.lookImageData == lookImageData) &&
            (identical(other.lookWithUserImageData, lookWithUserImageData) ||
                other.lookWithUserImageData == lookWithUserImageData) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_items),
      name,
      description,
      lookImageData,
      lookWithUserImageData,
      userId);

  /// Create a copy of Look
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LookImplCopyWith<_$LookImpl> get copyWith =>
      __$$LookImplCopyWithImpl<_$LookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LookImplToJson(
      this,
    );
  }
}

abstract class _Look extends Look {
  const factory _Look(
      {required final String id,
      required final List<Item> items,
      required final String name,
      required final String description,
      required final String lookImageData,
      required final String lookWithUserImageData,
      required final String userId}) = _$LookImpl;
  const _Look._() : super._();

  factory _Look.fromJson(Map<String, dynamic> json) = _$LookImpl.fromJson;

  @override
  String get id;
  @override
  List<Item> get items;
  @override
  String get name;
  @override
  String get description;
  @override
  String get lookImageData;
  @override
  String get lookWithUserImageData;
  @override
  String get userId;

  /// Create a copy of Look
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LookImplCopyWith<_$LookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

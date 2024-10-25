// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get colors => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get imageLocalPath => throw _privateConstructorUsedError;
  String get imageData => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime createdAt,
      String colors,
      String brand,
      String category,
      bool isFavorite,
      int price,
      String userId,
      String imageLocalPath,
      String imageData,
      String notes,
      String size,
      List<Tag> tags});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? colors = null,
    Object? brand = null,
    Object? category = null,
    Object? isFavorite = null,
    Object? price = null,
    Object? userId = null,
    Object? imageLocalPath = null,
    Object? imageData = null,
    Object? notes = null,
    Object? size = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageLocalPath: null == imageLocalPath
          ? _value.imageLocalPath
          : imageLocalPath // ignore: cast_nullable_to_non_nullable
              as String,
      imageData: null == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime createdAt,
      String colors,
      String brand,
      String category,
      bool isFavorite,
      int price,
      String userId,
      String imageLocalPath,
      String imageData,
      String notes,
      String size,
      List<Tag> tags});
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? colors = null,
    Object? brand = null,
    Object? category = null,
    Object? isFavorite = null,
    Object? price = null,
    Object? userId = null,
    Object? imageLocalPath = null,
    Object? imageData = null,
    Object? notes = null,
    Object? size = null,
    Object? tags = null,
  }) {
    return _then(_$ItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageLocalPath: null == imageLocalPath
          ? _value.imageLocalPath
          : imageLocalPath // ignore: cast_nullable_to_non_nullable
              as String,
      imageData: null == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl extends _Item {
  const _$ItemImpl(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.colors,
      required this.brand,
      required this.category,
      required this.isFavorite,
      required this.price,
      required this.userId,
      required this.imageLocalPath,
      required this.imageData,
      required this.notes,
      required this.size,
      required final List<Tag> tags})
      : _tags = tags,
        super._();

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final String colors;
  @override
  final String brand;
  @override
  final String category;
  @override
  final bool isFavorite;
  @override
  final int price;
  @override
  final String userId;
  @override
  final String imageLocalPath;
  @override
  final String imageData;
  @override
  final String notes;
  @override
  final String size;
  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'Item(id: $id, name: $name, createdAt: $createdAt, colors: $colors, brand: $brand, category: $category, isFavorite: $isFavorite, price: $price, userId: $userId, imageLocalPath: $imageLocalPath, imageData: $imageData, notes: $notes, size: $size, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.imageLocalPath, imageLocalPath) ||
                other.imageLocalPath == imageLocalPath) &&
            (identical(other.imageData, imageData) ||
                other.imageData == imageData) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      createdAt,
      colors,
      brand,
      category,
      isFavorite,
      price,
      userId,
      imageLocalPath,
      imageData,
      notes,
      size,
      const DeepCollectionEquality().hash(_tags));

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item extends Item {
  const factory _Item(
      {required final String id,
      required final String name,
      required final DateTime createdAt,
      required final String colors,
      required final String brand,
      required final String category,
      required final bool isFavorite,
      required final int price,
      required final String userId,
      required final String imageLocalPath,
      required final String imageData,
      required final String notes,
      required final String size,
      required final List<Tag> tags}) = _$ItemImpl;
  const _Item._() : super._();

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get createdAt;
  @override
  String get colors;
  @override
  String get brand;
  @override
  String get category;
  @override
  bool get isFavorite;
  @override
  int get price;
  @override
  String get userId;
  @override
  String get imageLocalPath;
  @override
  String get imageData;
  @override
  String get notes;
  @override
  String get size;
  @override
  List<Tag> get tags;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

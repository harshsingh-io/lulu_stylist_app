// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedDataModel<T> _$PaginatedDataModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _PaginatedDataModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PaginatedDataModel<T> {
  List<T> get items => throw _privateConstructorUsedError;
  int get page =>
      throw _privateConstructorUsedError; //On which page you want to toggle
  int get total =>
      throw _privateConstructorUsedError; //Total No. of object should be in api
  int get size => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;

  /// Serializes this PaginatedDataModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PaginatedDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedDataModelCopyWith<T, PaginatedDataModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedDataModelCopyWith<T, $Res> {
  factory $PaginatedDataModelCopyWith(PaginatedDataModel<T> value,
          $Res Function(PaginatedDataModel<T>) then) =
      _$PaginatedDataModelCopyWithImpl<T, $Res, PaginatedDataModel<T>>;
  @useResult
  $Res call({List<T> items, int page, int total, int size, int pages});
}

/// @nodoc
class _$PaginatedDataModelCopyWithImpl<T, $Res,
        $Val extends PaginatedDataModel<T>>
    implements $PaginatedDataModelCopyWith<T, $Res> {
  _$PaginatedDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? size = null,
    Object? pages = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedDataModelImplCopyWith<T, $Res>
    implements $PaginatedDataModelCopyWith<T, $Res> {
  factory _$$PaginatedDataModelImplCopyWith(_$PaginatedDataModelImpl<T> value,
          $Res Function(_$PaginatedDataModelImpl<T>) then) =
      __$$PaginatedDataModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> items, int page, int total, int size, int pages});
}

/// @nodoc
class __$$PaginatedDataModelImplCopyWithImpl<T, $Res>
    extends _$PaginatedDataModelCopyWithImpl<T, $Res,
        _$PaginatedDataModelImpl<T>>
    implements _$$PaginatedDataModelImplCopyWith<T, $Res> {
  __$$PaginatedDataModelImplCopyWithImpl(_$PaginatedDataModelImpl<T> _value,
      $Res Function(_$PaginatedDataModelImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? total = null,
    Object? size = null,
    Object? pages = null,
  }) {
    return _then(_$PaginatedDataModelImpl<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PaginatedDataModelImpl<T> implements _PaginatedDataModel<T> {
  const _$PaginatedDataModelImpl(
      {required final List<T> items,
      required this.page,
      required this.total,
      required this.size,
      required this.pages})
      : _items = items;

  factory _$PaginatedDataModelImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$PaginatedDataModelImplFromJson(json, fromJsonT);

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int page;
//On which page you want to toggle
  @override
  final int total;
//Total No. of object should be in api
  @override
  final int size;
  @override
  final int pages;

  @override
  String toString() {
    return 'PaginatedDataModel<$T>(items: $items, page: $page, total: $total, size: $size, pages: $pages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedDataModelImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), page, total, size, pages);

  /// Create a copy of PaginatedDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedDataModelImplCopyWith<T, _$PaginatedDataModelImpl<T>>
      get copyWith => __$$PaginatedDataModelImplCopyWithImpl<T,
          _$PaginatedDataModelImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PaginatedDataModelImplToJson<T>(this, toJsonT);
  }
}

abstract class _PaginatedDataModel<T> implements PaginatedDataModel<T> {
  const factory _PaginatedDataModel(
      {required final List<T> items,
      required final int page,
      required final int total,
      required final int size,
      required final int pages}) = _$PaginatedDataModelImpl<T>;

  factory _PaginatedDataModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$PaginatedDataModelImpl<T>.fromJson;

  @override
  List<T> get items;
  @override
  int get page; //On which page you want to toggle
  @override
  int get total; //Total No. of object should be in api
  @override
  int get size;
  @override
  int get pages;

  /// Create a copy of PaginatedDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedDataModelImplCopyWith<T, _$PaginatedDataModelImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

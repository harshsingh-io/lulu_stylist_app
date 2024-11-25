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
  String get userId => throw _privateConstructorUsedError;
  UserDetails get userDetails => throw _privateConstructorUsedError;
  List<Item> get wardrobeItems => throw _privateConstructorUsedError;
  UserPreferences get preferences => throw _privateConstructorUsedError;
  String? get profileImagePath => throw _privateConstructorUsedError;

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
  $Res call(
      {String userId,
      UserDetails userDetails,
      List<Item> wardrobeItems,
      UserPreferences preferences,
      String? profileImagePath});

  $UserDetailsCopyWith<$Res> get userDetails;
  $UserPreferencesCopyWith<$Res> get preferences;
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
    Object? userId = null,
    Object? userDetails = null,
    Object? wardrobeItems = null,
    Object? preferences = null,
    Object? profileImagePath = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails,
      wardrobeItems: null == wardrobeItems
          ? _value.wardrobeItems
          : wardrobeItems // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferences,
      profileImagePath: freezed == profileImagePath
          ? _value.profileImagePath
          : profileImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of UserUpdateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDetailsCopyWith<$Res> get userDetails {
    return $UserDetailsCopyWith<$Res>(_value.userDetails, (value) {
      return _then(_value.copyWith(userDetails: value) as $Val);
    });
  }

  /// Create a copy of UserUpdateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesCopyWith<$Res> get preferences {
    return $UserPreferencesCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
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
  $Res call(
      {String userId,
      UserDetails userDetails,
      List<Item> wardrobeItems,
      UserPreferences preferences,
      String? profileImagePath});

  @override
  $UserDetailsCopyWith<$Res> get userDetails;
  @override
  $UserPreferencesCopyWith<$Res> get preferences;
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
    Object? userId = null,
    Object? userDetails = null,
    Object? wardrobeItems = null,
    Object? preferences = null,
    Object? profileImagePath = freezed,
  }) {
    return _then(_$UserUpdateRequestModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails,
      wardrobeItems: null == wardrobeItems
          ? _value._wardrobeItems
          : wardrobeItems // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferences,
      profileImagePath: freezed == profileImagePath
          ? _value.profileImagePath
          : profileImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserUpdateRequestModelImpl implements _UserUpdateRequestModel {
  const _$UserUpdateRequestModelImpl(
      {required this.userId,
      required this.userDetails,
      required final List<Item> wardrobeItems,
      required this.preferences,
      this.profileImagePath})
      : _wardrobeItems = wardrobeItems;

  factory _$UserUpdateRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserUpdateRequestModelImplFromJson(json);

  @override
  final String userId;
  @override
  final UserDetails userDetails;
  final List<Item> _wardrobeItems;
  @override
  List<Item> get wardrobeItems {
    if (_wardrobeItems is EqualUnmodifiableListView) return _wardrobeItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wardrobeItems);
  }

  @override
  final UserPreferences preferences;
  @override
  final String? profileImagePath;

  @override
  String toString() {
    return 'UserUpdateRequestModel(userId: $userId, userDetails: $userDetails, wardrobeItems: $wardrobeItems, preferences: $preferences, profileImagePath: $profileImagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUpdateRequestModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            const DeepCollectionEquality()
                .equals(other._wardrobeItems, _wardrobeItems) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.profileImagePath, profileImagePath) ||
                other.profileImagePath == profileImagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      userDetails,
      const DeepCollectionEquality().hash(_wardrobeItems),
      preferences,
      profileImagePath);

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
      {required final String userId,
      required final UserDetails userDetails,
      required final List<Item> wardrobeItems,
      required final UserPreferences preferences,
      final String? profileImagePath}) = _$UserUpdateRequestModelImpl;

  factory _UserUpdateRequestModel.fromJson(Map<String, dynamic> json) =
      _$UserUpdateRequestModelImpl.fromJson;

  @override
  String get userId;
  @override
  UserDetails get userDetails;
  @override
  List<Item> get wardrobeItems;
  @override
  UserPreferences get preferences;
  @override
  String? get profileImagePath;

  /// Create a copy of UserUpdateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserUpdateRequestModelImplCopyWith<_$UserUpdateRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) {
  return _UserDetails.fromJson(json);
}

/// @nodoc
mixin _$UserDetails {
  String get name => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get locationLong => throw _privateConstructorUsedError;
  String? get locationLat => throw _privateConstructorUsedError;
  BodyMeasurements? get bodyMeasurements => throw _privateConstructorUsedError;
  StylePreferences? get stylePreferences => throw _privateConstructorUsedError;

  /// Serializes this UserDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailsCopyWith<UserDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsCopyWith<$Res> {
  factory $UserDetailsCopyWith(
          UserDetails value, $Res Function(UserDetails) then) =
      _$UserDetailsCopyWithImpl<$Res, UserDetails>;
  @useResult
  $Res call(
      {String name,
      int age,
      String? gender,
      String? locationLong,
      String? locationLat,
      BodyMeasurements? bodyMeasurements,
      StylePreferences? stylePreferences});

  $BodyMeasurementsCopyWith<$Res>? get bodyMeasurements;
  $StylePreferencesCopyWith<$Res>? get stylePreferences;
}

/// @nodoc
class _$UserDetailsCopyWithImpl<$Res, $Val extends UserDetails>
    implements $UserDetailsCopyWith<$Res> {
  _$UserDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
    Object? gender = freezed,
    Object? locationLong = freezed,
    Object? locationLat = freezed,
    Object? bodyMeasurements = freezed,
    Object? stylePreferences = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLong: freezed == locationLong
          ? _value.locationLong
          : locationLong // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLat: freezed == locationLat
          ? _value.locationLat
          : locationLat // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyMeasurements: freezed == bodyMeasurements
          ? _value.bodyMeasurements
          : bodyMeasurements // ignore: cast_nullable_to_non_nullable
              as BodyMeasurements?,
      stylePreferences: freezed == stylePreferences
          ? _value.stylePreferences
          : stylePreferences // ignore: cast_nullable_to_non_nullable
              as StylePreferences?,
    ) as $Val);
  }

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BodyMeasurementsCopyWith<$Res>? get bodyMeasurements {
    if (_value.bodyMeasurements == null) {
      return null;
    }

    return $BodyMeasurementsCopyWith<$Res>(_value.bodyMeasurements!, (value) {
      return _then(_value.copyWith(bodyMeasurements: value) as $Val);
    });
  }

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StylePreferencesCopyWith<$Res>? get stylePreferences {
    if (_value.stylePreferences == null) {
      return null;
    }

    return $StylePreferencesCopyWith<$Res>(_value.stylePreferences!, (value) {
      return _then(_value.copyWith(stylePreferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDetailsImplCopyWith<$Res>
    implements $UserDetailsCopyWith<$Res> {
  factory _$$UserDetailsImplCopyWith(
          _$UserDetailsImpl value, $Res Function(_$UserDetailsImpl) then) =
      __$$UserDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int age,
      String? gender,
      String? locationLong,
      String? locationLat,
      BodyMeasurements? bodyMeasurements,
      StylePreferences? stylePreferences});

  @override
  $BodyMeasurementsCopyWith<$Res>? get bodyMeasurements;
  @override
  $StylePreferencesCopyWith<$Res>? get stylePreferences;
}

/// @nodoc
class __$$UserDetailsImplCopyWithImpl<$Res>
    extends _$UserDetailsCopyWithImpl<$Res, _$UserDetailsImpl>
    implements _$$UserDetailsImplCopyWith<$Res> {
  __$$UserDetailsImplCopyWithImpl(
      _$UserDetailsImpl _value, $Res Function(_$UserDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
    Object? gender = freezed,
    Object? locationLong = freezed,
    Object? locationLat = freezed,
    Object? bodyMeasurements = freezed,
    Object? stylePreferences = freezed,
  }) {
    return _then(_$UserDetailsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLong: freezed == locationLong
          ? _value.locationLong
          : locationLong // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLat: freezed == locationLat
          ? _value.locationLat
          : locationLat // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyMeasurements: freezed == bodyMeasurements
          ? _value.bodyMeasurements
          : bodyMeasurements // ignore: cast_nullable_to_non_nullable
              as BodyMeasurements?,
      stylePreferences: freezed == stylePreferences
          ? _value.stylePreferences
          : stylePreferences // ignore: cast_nullable_to_non_nullable
              as StylePreferences?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDetailsImpl implements _UserDetails {
  const _$UserDetailsImpl(
      {required this.name,
      required this.age,
      this.gender,
      this.locationLong,
      this.locationLat,
      this.bodyMeasurements,
      this.stylePreferences});

  factory _$UserDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDetailsImplFromJson(json);

  @override
  final String name;
  @override
  final int age;
  @override
  final String? gender;
  @override
  final String? locationLong;
  @override
  final String? locationLat;
  @override
  final BodyMeasurements? bodyMeasurements;
  @override
  final StylePreferences? stylePreferences;

  @override
  String toString() {
    return 'UserDetails(name: $name, age: $age, gender: $gender, locationLong: $locationLong, locationLat: $locationLat, bodyMeasurements: $bodyMeasurements, stylePreferences: $stylePreferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.locationLong, locationLong) ||
                other.locationLong == locationLong) &&
            (identical(other.locationLat, locationLat) ||
                other.locationLat == locationLat) &&
            (identical(other.bodyMeasurements, bodyMeasurements) ||
                other.bodyMeasurements == bodyMeasurements) &&
            (identical(other.stylePreferences, stylePreferences) ||
                other.stylePreferences == stylePreferences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, age, gender, locationLong,
      locationLat, bodyMeasurements, stylePreferences);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsImplCopyWith<_$UserDetailsImpl> get copyWith =>
      __$$UserDetailsImplCopyWithImpl<_$UserDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDetailsImplToJson(
      this,
    );
  }
}

abstract class _UserDetails implements UserDetails {
  const factory _UserDetails(
      {required final String name,
      required final int age,
      final String? gender,
      final String? locationLong,
      final String? locationLat,
      final BodyMeasurements? bodyMeasurements,
      final StylePreferences? stylePreferences}) = _$UserDetailsImpl;

  factory _UserDetails.fromJson(Map<String, dynamic> json) =
      _$UserDetailsImpl.fromJson;

  @override
  String get name;
  @override
  int get age;
  @override
  String? get gender;
  @override
  String? get locationLong;
  @override
  String? get locationLat;
  @override
  BodyMeasurements? get bodyMeasurements;
  @override
  StylePreferences? get stylePreferences;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailsImplCopyWith<_$UserDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BodyMeasurements _$BodyMeasurementsFromJson(Map<String, dynamic> json) {
  return _BodyMeasurements.fromJson(json);
}

/// @nodoc
mixin _$BodyMeasurements {
  double get height => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  String? get bodyType => throw _privateConstructorUsedError;

  /// Serializes this BodyMeasurements to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BodyMeasurements
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BodyMeasurementsCopyWith<BodyMeasurements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyMeasurementsCopyWith<$Res> {
  factory $BodyMeasurementsCopyWith(
          BodyMeasurements value, $Res Function(BodyMeasurements) then) =
      _$BodyMeasurementsCopyWithImpl<$Res, BodyMeasurements>;
  @useResult
  $Res call({double height, double weight, String? bodyType});
}

/// @nodoc
class _$BodyMeasurementsCopyWithImpl<$Res, $Val extends BodyMeasurements>
    implements $BodyMeasurementsCopyWith<$Res> {
  _$BodyMeasurementsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BodyMeasurements
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? weight = null,
    Object? bodyType = freezed,
  }) {
    return _then(_value.copyWith(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      bodyType: freezed == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BodyMeasurementsImplCopyWith<$Res>
    implements $BodyMeasurementsCopyWith<$Res> {
  factory _$$BodyMeasurementsImplCopyWith(_$BodyMeasurementsImpl value,
          $Res Function(_$BodyMeasurementsImpl) then) =
      __$$BodyMeasurementsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double height, double weight, String? bodyType});
}

/// @nodoc
class __$$BodyMeasurementsImplCopyWithImpl<$Res>
    extends _$BodyMeasurementsCopyWithImpl<$Res, _$BodyMeasurementsImpl>
    implements _$$BodyMeasurementsImplCopyWith<$Res> {
  __$$BodyMeasurementsImplCopyWithImpl(_$BodyMeasurementsImpl _value,
      $Res Function(_$BodyMeasurementsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BodyMeasurements
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? weight = null,
    Object? bodyType = freezed,
  }) {
    return _then(_$BodyMeasurementsImpl(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      bodyType: freezed == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyMeasurementsImpl implements _BodyMeasurements {
  const _$BodyMeasurementsImpl(
      {required this.height, required this.weight, this.bodyType});

  factory _$BodyMeasurementsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyMeasurementsImplFromJson(json);

  @override
  final double height;
  @override
  final double weight;
  @override
  final String? bodyType;

  @override
  String toString() {
    return 'BodyMeasurements(height: $height, weight: $weight, bodyType: $bodyType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyMeasurementsImpl &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.bodyType, bodyType) ||
                other.bodyType == bodyType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, height, weight, bodyType);

  /// Create a copy of BodyMeasurements
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyMeasurementsImplCopyWith<_$BodyMeasurementsImpl> get copyWith =>
      __$$BodyMeasurementsImplCopyWithImpl<_$BodyMeasurementsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyMeasurementsImplToJson(
      this,
    );
  }
}

abstract class _BodyMeasurements implements BodyMeasurements {
  const factory _BodyMeasurements(
      {required final double height,
      required final double weight,
      final String? bodyType}) = _$BodyMeasurementsImpl;

  factory _BodyMeasurements.fromJson(Map<String, dynamic> json) =
      _$BodyMeasurementsImpl.fromJson;

  @override
  double get height;
  @override
  double get weight;
  @override
  String? get bodyType;

  /// Create a copy of BodyMeasurements
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BodyMeasurementsImplCopyWith<_$BodyMeasurementsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StylePreferences _$StylePreferencesFromJson(Map<String, dynamic> json) {
  return _StylePreferences.fromJson(json);
}

/// @nodoc
mixin _$StylePreferences {
  List<String> get favoriteColors => throw _privateConstructorUsedError;
  List<String> get preferredBrands => throw _privateConstructorUsedError;
  List<String> get lifestyleChoices => throw _privateConstructorUsedError;
  Budget get budget => throw _privateConstructorUsedError;
  ShoppingHabits get shoppingHabits => throw _privateConstructorUsedError;

  /// Serializes this StylePreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StylePreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StylePreferencesCopyWith<StylePreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StylePreferencesCopyWith<$Res> {
  factory $StylePreferencesCopyWith(
          StylePreferences value, $Res Function(StylePreferences) then) =
      _$StylePreferencesCopyWithImpl<$Res, StylePreferences>;
  @useResult
  $Res call(
      {List<String> favoriteColors,
      List<String> preferredBrands,
      List<String> lifestyleChoices,
      Budget budget,
      ShoppingHabits shoppingHabits});

  $BudgetCopyWith<$Res> get budget;
  $ShoppingHabitsCopyWith<$Res> get shoppingHabits;
}

/// @nodoc
class _$StylePreferencesCopyWithImpl<$Res, $Val extends StylePreferences>
    implements $StylePreferencesCopyWith<$Res> {
  _$StylePreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StylePreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteColors = null,
    Object? preferredBrands = null,
    Object? lifestyleChoices = null,
    Object? budget = null,
    Object? shoppingHabits = null,
  }) {
    return _then(_value.copyWith(
      favoriteColors: null == favoriteColors
          ? _value.favoriteColors
          : favoriteColors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredBrands: null == preferredBrands
          ? _value.preferredBrands
          : preferredBrands // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lifestyleChoices: null == lifestyleChoices
          ? _value.lifestyleChoices
          : lifestyleChoices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as Budget,
      shoppingHabits: null == shoppingHabits
          ? _value.shoppingHabits
          : shoppingHabits // ignore: cast_nullable_to_non_nullable
              as ShoppingHabits,
    ) as $Val);
  }

  /// Create a copy of StylePreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BudgetCopyWith<$Res> get budget {
    return $BudgetCopyWith<$Res>(_value.budget, (value) {
      return _then(_value.copyWith(budget: value) as $Val);
    });
  }

  /// Create a copy of StylePreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShoppingHabitsCopyWith<$Res> get shoppingHabits {
    return $ShoppingHabitsCopyWith<$Res>(_value.shoppingHabits, (value) {
      return _then(_value.copyWith(shoppingHabits: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StylePreferencesImplCopyWith<$Res>
    implements $StylePreferencesCopyWith<$Res> {
  factory _$$StylePreferencesImplCopyWith(_$StylePreferencesImpl value,
          $Res Function(_$StylePreferencesImpl) then) =
      __$$StylePreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> favoriteColors,
      List<String> preferredBrands,
      List<String> lifestyleChoices,
      Budget budget,
      ShoppingHabits shoppingHabits});

  @override
  $BudgetCopyWith<$Res> get budget;
  @override
  $ShoppingHabitsCopyWith<$Res> get shoppingHabits;
}

/// @nodoc
class __$$StylePreferencesImplCopyWithImpl<$Res>
    extends _$StylePreferencesCopyWithImpl<$Res, _$StylePreferencesImpl>
    implements _$$StylePreferencesImplCopyWith<$Res> {
  __$$StylePreferencesImplCopyWithImpl(_$StylePreferencesImpl _value,
      $Res Function(_$StylePreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of StylePreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteColors = null,
    Object? preferredBrands = null,
    Object? lifestyleChoices = null,
    Object? budget = null,
    Object? shoppingHabits = null,
  }) {
    return _then(_$StylePreferencesImpl(
      favoriteColors: null == favoriteColors
          ? _value._favoriteColors
          : favoriteColors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredBrands: null == preferredBrands
          ? _value._preferredBrands
          : preferredBrands // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lifestyleChoices: null == lifestyleChoices
          ? _value._lifestyleChoices
          : lifestyleChoices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as Budget,
      shoppingHabits: null == shoppingHabits
          ? _value.shoppingHabits
          : shoppingHabits // ignore: cast_nullable_to_non_nullable
              as ShoppingHabits,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StylePreferencesImpl implements _StylePreferences {
  const _$StylePreferencesImpl(
      {required final List<String> favoriteColors,
      required final List<String> preferredBrands,
      required final List<String> lifestyleChoices,
      required this.budget,
      required this.shoppingHabits})
      : _favoriteColors = favoriteColors,
        _preferredBrands = preferredBrands,
        _lifestyleChoices = lifestyleChoices;

  factory _$StylePreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$StylePreferencesImplFromJson(json);

  final List<String> _favoriteColors;
  @override
  List<String> get favoriteColors {
    if (_favoriteColors is EqualUnmodifiableListView) return _favoriteColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteColors);
  }

  final List<String> _preferredBrands;
  @override
  List<String> get preferredBrands {
    if (_preferredBrands is EqualUnmodifiableListView) return _preferredBrands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredBrands);
  }

  final List<String> _lifestyleChoices;
  @override
  List<String> get lifestyleChoices {
    if (_lifestyleChoices is EqualUnmodifiableListView)
      return _lifestyleChoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lifestyleChoices);
  }

  @override
  final Budget budget;
  @override
  final ShoppingHabits shoppingHabits;

  @override
  String toString() {
    return 'StylePreferences(favoriteColors: $favoriteColors, preferredBrands: $preferredBrands, lifestyleChoices: $lifestyleChoices, budget: $budget, shoppingHabits: $shoppingHabits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StylePreferencesImpl &&
            const DeepCollectionEquality()
                .equals(other._favoriteColors, _favoriteColors) &&
            const DeepCollectionEquality()
                .equals(other._preferredBrands, _preferredBrands) &&
            const DeepCollectionEquality()
                .equals(other._lifestyleChoices, _lifestyleChoices) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.shoppingHabits, shoppingHabits) ||
                other.shoppingHabits == shoppingHabits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_favoriteColors),
      const DeepCollectionEquality().hash(_preferredBrands),
      const DeepCollectionEquality().hash(_lifestyleChoices),
      budget,
      shoppingHabits);

  /// Create a copy of StylePreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StylePreferencesImplCopyWith<_$StylePreferencesImpl> get copyWith =>
      __$$StylePreferencesImplCopyWithImpl<_$StylePreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StylePreferencesImplToJson(
      this,
    );
  }
}

abstract class _StylePreferences implements StylePreferences {
  const factory _StylePreferences(
      {required final List<String> favoriteColors,
      required final List<String> preferredBrands,
      required final List<String> lifestyleChoices,
      required final Budget budget,
      required final ShoppingHabits shoppingHabits}) = _$StylePreferencesImpl;

  factory _StylePreferences.fromJson(Map<String, dynamic> json) =
      _$StylePreferencesImpl.fromJson;

  @override
  List<String> get favoriteColors;
  @override
  List<String> get preferredBrands;
  @override
  List<String> get lifestyleChoices;
  @override
  Budget get budget;
  @override
  ShoppingHabits get shoppingHabits;

  /// Create a copy of StylePreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StylePreferencesImplCopyWith<_$StylePreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Budget _$BudgetFromJson(Map<String, dynamic> json) {
  return _Budget.fromJson(json);
}

/// @nodoc
mixin _$Budget {
  double get min => throw _privateConstructorUsedError;
  double get max => throw _privateConstructorUsedError;

  /// Serializes this Budget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetCopyWith<Budget> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetCopyWith<$Res> {
  factory $BudgetCopyWith(Budget value, $Res Function(Budget) then) =
      _$BudgetCopyWithImpl<$Res, Budget>;
  @useResult
  $Res call({double min, double max});
}

/// @nodoc
class _$BudgetCopyWithImpl<$Res, $Val extends Budget>
    implements $BudgetCopyWith<$Res> {
  _$BudgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetImplCopyWith<$Res> implements $BudgetCopyWith<$Res> {
  factory _$$BudgetImplCopyWith(
          _$BudgetImpl value, $Res Function(_$BudgetImpl) then) =
      __$$BudgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double min, double max});
}

/// @nodoc
class __$$BudgetImplCopyWithImpl<$Res>
    extends _$BudgetCopyWithImpl<$Res, _$BudgetImpl>
    implements _$$BudgetImplCopyWith<$Res> {
  __$$BudgetImplCopyWithImpl(
      _$BudgetImpl _value, $Res Function(_$BudgetImpl) _then)
      : super(_value, _then);

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_$BudgetImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetImpl implements _Budget {
  const _$BudgetImpl({required this.min, required this.max});

  factory _$BudgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetImplFromJson(json);

  @override
  final double min;
  @override
  final double max;

  @override
  String toString() {
    return 'Budget(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetImplCopyWith<_$BudgetImpl> get copyWith =>
      __$$BudgetImplCopyWithImpl<_$BudgetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetImplToJson(
      this,
    );
  }
}

abstract class _Budget implements Budget {
  const factory _Budget(
      {required final double min, required final double max}) = _$BudgetImpl;

  factory _Budget.fromJson(Map<String, dynamic> json) = _$BudgetImpl.fromJson;

  @override
  double get min;
  @override
  double get max;

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetImplCopyWith<_$BudgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShoppingHabits _$ShoppingHabitsFromJson(Map<String, dynamic> json) {
  return _ShoppingHabits.fromJson(json);
}

/// @nodoc
mixin _$ShoppingHabits {
  String get frequency => throw _privateConstructorUsedError;
  List<String> get preferredRetailers => throw _privateConstructorUsedError;

  /// Serializes this ShoppingHabits to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingHabits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingHabitsCopyWith<ShoppingHabits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingHabitsCopyWith<$Res> {
  factory $ShoppingHabitsCopyWith(
          ShoppingHabits value, $Res Function(ShoppingHabits) then) =
      _$ShoppingHabitsCopyWithImpl<$Res, ShoppingHabits>;
  @useResult
  $Res call({String frequency, List<String> preferredRetailers});
}

/// @nodoc
class _$ShoppingHabitsCopyWithImpl<$Res, $Val extends ShoppingHabits>
    implements $ShoppingHabitsCopyWith<$Res> {
  _$ShoppingHabitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingHabits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frequency = null,
    Object? preferredRetailers = null,
  }) {
    return _then(_value.copyWith(
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      preferredRetailers: null == preferredRetailers
          ? _value.preferredRetailers
          : preferredRetailers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingHabitsImplCopyWith<$Res>
    implements $ShoppingHabitsCopyWith<$Res> {
  factory _$$ShoppingHabitsImplCopyWith(_$ShoppingHabitsImpl value,
          $Res Function(_$ShoppingHabitsImpl) then) =
      __$$ShoppingHabitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String frequency, List<String> preferredRetailers});
}

/// @nodoc
class __$$ShoppingHabitsImplCopyWithImpl<$Res>
    extends _$ShoppingHabitsCopyWithImpl<$Res, _$ShoppingHabitsImpl>
    implements _$$ShoppingHabitsImplCopyWith<$Res> {
  __$$ShoppingHabitsImplCopyWithImpl(
      _$ShoppingHabitsImpl _value, $Res Function(_$ShoppingHabitsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingHabits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frequency = null,
    Object? preferredRetailers = null,
  }) {
    return _then(_$ShoppingHabitsImpl(
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      preferredRetailers: null == preferredRetailers
          ? _value._preferredRetailers
          : preferredRetailers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingHabitsImpl implements _ShoppingHabits {
  const _$ShoppingHabitsImpl(
      {required this.frequency, required final List<String> preferredRetailers})
      : _preferredRetailers = preferredRetailers;

  factory _$ShoppingHabitsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingHabitsImplFromJson(json);

  @override
  final String frequency;
  final List<String> _preferredRetailers;
  @override
  List<String> get preferredRetailers {
    if (_preferredRetailers is EqualUnmodifiableListView)
      return _preferredRetailers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredRetailers);
  }

  @override
  String toString() {
    return 'ShoppingHabits(frequency: $frequency, preferredRetailers: $preferredRetailers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingHabitsImpl &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            const DeepCollectionEquality()
                .equals(other._preferredRetailers, _preferredRetailers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, frequency,
      const DeepCollectionEquality().hash(_preferredRetailers));

  /// Create a copy of ShoppingHabits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingHabitsImplCopyWith<_$ShoppingHabitsImpl> get copyWith =>
      __$$ShoppingHabitsImplCopyWithImpl<_$ShoppingHabitsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingHabitsImplToJson(
      this,
    );
  }
}

abstract class _ShoppingHabits implements ShoppingHabits {
  const factory _ShoppingHabits(
      {required final String frequency,
      required final List<String> preferredRetailers}) = _$ShoppingHabitsImpl;

  factory _ShoppingHabits.fromJson(Map<String, dynamic> json) =
      _$ShoppingHabitsImpl.fromJson;

  @override
  String get frequency;
  @override
  List<String> get preferredRetailers;

  /// Create a copy of ShoppingHabits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingHabitsImplCopyWith<_$ShoppingHabitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  bool get receiveNotifications => throw _privateConstructorUsedError;
  bool get allowDataSharing => throw _privateConstructorUsedError;

  /// Serializes this UserPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call({bool receiveNotifications, bool allowDataSharing});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiveNotifications = null,
    Object? allowDataSharing = null,
  }) {
    return _then(_value.copyWith(
      receiveNotifications: null == receiveNotifications
          ? _value.receiveNotifications
          : receiveNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      allowDataSharing: null == allowDataSharing
          ? _value.allowDataSharing
          : allowDataSharing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(_$UserPreferencesImpl value,
          $Res Function(_$UserPreferencesImpl) then) =
      __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool receiveNotifications, bool allowDataSharing});
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
      _$UserPreferencesImpl _value, $Res Function(_$UserPreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiveNotifications = null,
    Object? allowDataSharing = null,
  }) {
    return _then(_$UserPreferencesImpl(
      receiveNotifications: null == receiveNotifications
          ? _value.receiveNotifications
          : receiveNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      allowDataSharing: null == allowDataSharing
          ? _value.allowDataSharing
          : allowDataSharing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesImpl implements _UserPreferences {
  const _$UserPreferencesImpl(
      {required this.receiveNotifications, required this.allowDataSharing});

  factory _$UserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesImplFromJson(json);

  @override
  final bool receiveNotifications;
  @override
  final bool allowDataSharing;

  @override
  String toString() {
    return 'UserPreferences(receiveNotifications: $receiveNotifications, allowDataSharing: $allowDataSharing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            (identical(other.receiveNotifications, receiveNotifications) ||
                other.receiveNotifications == receiveNotifications) &&
            (identical(other.allowDataSharing, allowDataSharing) ||
                other.allowDataSharing == allowDataSharing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, receiveNotifications, allowDataSharing);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesImplToJson(
      this,
    );
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences(
      {required final bool receiveNotifications,
      required final bool allowDataSharing}) = _$UserPreferencesImpl;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesImpl.fromJson;

  @override
  bool get receiveNotifications;
  @override
  bool get allowDataSharing;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

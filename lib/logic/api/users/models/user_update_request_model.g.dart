// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserUpdateRequestModelImpl _$$UserUpdateRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserUpdateRequestModelImpl(
      userId: json['userId'] as String,
      userDetails:
          UserDetails.fromJson(json['userDetails'] as Map<String, dynamic>),
      wardrobeItems: (json['wardrobeItems'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      preferences:
          UserPreferences.fromJson(json['preferences'] as Map<String, dynamic>),
      profileImagePath: json['profileImagePath'] as String?,
    );

Map<String, dynamic> _$$UserUpdateRequestModelImplToJson(
        _$UserUpdateRequestModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userDetails': instance.userDetails,
      'wardrobeItems': instance.wardrobeItems,
      'preferences': instance.preferences,
      'profileImagePath': instance.profileImagePath,
    };

_$UserDetailsImpl _$$UserDetailsImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailsImpl(
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String?,
      locationLong: json['locationLong'] as String?,
      locationLat: json['locationLat'] as String?,
      bodyMeasurements: json['bodyMeasurements'] == null
          ? null
          : BodyMeasurements.fromJson(
              json['bodyMeasurements'] as Map<String, dynamic>),
      stylePreferences: json['stylePreferences'] == null
          ? null
          : StylePreferences.fromJson(
              json['stylePreferences'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserDetailsImplToJson(_$UserDetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'locationLong': instance.locationLong,
      'locationLat': instance.locationLat,
      'bodyMeasurements': instance.bodyMeasurements,
      'stylePreferences': instance.stylePreferences,
    };

_$BodyMeasurementsImpl _$$BodyMeasurementsImplFromJson(
        Map<String, dynamic> json) =>
    _$BodyMeasurementsImpl(
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      bodyType: json['bodyType'] as String?,
    );

Map<String, dynamic> _$$BodyMeasurementsImplToJson(
        _$BodyMeasurementsImpl instance) =>
    <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'bodyType': instance.bodyType,
    };

_$StylePreferencesImpl _$$StylePreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$StylePreferencesImpl(
      favoriteColors: (json['favoriteColors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      preferredBrands: (json['preferredBrands'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lifestyleChoices: (json['lifestyleChoices'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      budget: Budget.fromJson(json['budget'] as Map<String, dynamic>),
      shoppingHabits: ShoppingHabits.fromJson(
          json['shoppingHabits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StylePreferencesImplToJson(
        _$StylePreferencesImpl instance) =>
    <String, dynamic>{
      'favoriteColors': instance.favoriteColors,
      'preferredBrands': instance.preferredBrands,
      'lifestyleChoices': instance.lifestyleChoices,
      'budget': instance.budget,
      'shoppingHabits': instance.shoppingHabits,
    };

_$BudgetImpl _$$BudgetImplFromJson(Map<String, dynamic> json) => _$BudgetImpl(
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
    );

Map<String, dynamic> _$$BudgetImplToJson(_$BudgetImpl instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

_$ShoppingHabitsImpl _$$ShoppingHabitsImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingHabitsImpl(
      frequency: json['frequency'] as String,
      preferredRetailers: (json['preferredRetailers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ShoppingHabitsImplToJson(
        _$ShoppingHabitsImpl instance) =>
    <String, dynamic>{
      'frequency': instance.frequency,
      'preferredRetailers': instance.preferredRetailers,
    };

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      receiveNotifications: json['receiveNotifications'] as bool,
      allowDataSharing: json['allowDataSharing'] as bool,
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'receiveNotifications': instance.receiveNotifications,
      'allowDataSharing': instance.allowDataSharing,
    };

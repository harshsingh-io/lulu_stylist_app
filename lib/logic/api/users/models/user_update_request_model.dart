import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/item.dart';

part 'user_update_request_model.freezed.dart';
part 'user_update_request_model.g.dart';

@freezed
class UserUpdateRequestModel with _$UserUpdateRequestModel {
  const factory UserUpdateRequestModel({
    required String userId,
    String? profileImagePath,
    required UserDetails userDetails,
    required List<Item> wardrobeItems,
    required UserPreferences preferences,
  }) = _UserUpdateRequestModel;

  /// Connect the generated [_$UserUpdateRequestModelFromJson] function to the `fromJson`
  /// factory.
  factory UserUpdateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateRequestModelFromJson(json);
}

@freezed
class UserDetails with _$UserDetails {
  const factory UserDetails({
    required String name,
    required int age,
    String? gender,
    String? locationLong,
    String? locationLat,
    BodyMeasurements? bodyMeasurements,
    StylePreferences? stylePreferences,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
}

@freezed
class BodyMeasurements with _$BodyMeasurements {
  const factory BodyMeasurements({
    required double height,
    required double weight,
    String? bodyType,
  }) = _BodyMeasurements;

  factory BodyMeasurements.fromJson(Map<String, dynamic> json) =>
      _$BodyMeasurementsFromJson(json);
}

@freezed
class StylePreferences with _$StylePreferences {
  const factory StylePreferences({
    required List<String> favoriteColors,
    required List<String> preferredBrands,
    required List<String> lifestyleChoices,
    required Budget budget,
    required ShoppingHabits shoppingHabits,
  }) = _StylePreferences;

  factory StylePreferences.fromJson(Map<String, dynamic> json) =>
      _$StylePreferencesFromJson(json);
}

@freezed
class Budget with _$Budget {
  const factory Budget({
    required double min,
    required double max,
  }) = _Budget;

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);
}

@freezed
class ShoppingHabits with _$ShoppingHabits {
  const factory ShoppingHabits({
    required String frequency,
    required List<String> preferredRetailers,
  }) = _ShoppingHabits;

  factory ShoppingHabits.fromJson(Map<String, dynamic> json) =>
      _$ShoppingHabitsFromJson(json);
}

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    required bool receiveNotifications,
    required bool allowDataSharing,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}

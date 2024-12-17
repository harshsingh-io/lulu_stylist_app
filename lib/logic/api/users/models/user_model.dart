import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/wardrobe_item.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'id') required String userId,
    required String email,
    required String username,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'user_details') required UserDetails? userDetails,
    @JsonKey(name: 'wardrobe_items') required List<WardrobeItem> wardrobeItems,
    @JsonKey(name: 'user_preferences') required UserPreferences? preferences,
    @JsonKey(name: 'profile_image_url') String? profileImagePath,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class UserDetails with _$UserDetails {
  const factory UserDetails({
    required String name,
    required int age,
    String? gender,
    @JsonKey(name: 'location_long') String? locationLong,
    @JsonKey(name: 'location_lat') String? locationLat,
    @JsonKey(name: 'body_measurements') BodyMeasurements? bodyMeasurements,
    @JsonKey(name: 'style_preferences') StylePreferences? stylePreferences,
    required String id,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
}

@freezed
class BodyMeasurements with _$BodyMeasurements {
  const factory BodyMeasurements({
    required double height,
    required double weight,
    @JsonKey(name: 'body_type') String? bodyType,
    required String id,
  }) = _BodyMeasurements;

  factory BodyMeasurements.fromJson(Map<String, dynamic> json) =>
      _$BodyMeasurementsFromJson(json);
}

@freezed
class StylePreferences with _$StylePreferences {
  const factory StylePreferences({
    @JsonKey(name: 'favorite_colors') required List<String> favoriteColors,
    @JsonKey(name: 'preferred_brands') required List<String> preferredBrands,
    @JsonKey(name: 'lifestyle_choices') required List<String> lifestyleChoices,
    required String id,
    required Budget budget,
    @JsonKey(name: 'shopping_habits') required ShoppingHabits shoppingHabits,
  }) = _StylePreferences;

  factory StylePreferences.fromJson(Map<String, dynamic> json) =>
      _$StylePreferencesFromJson(json);
}

@freezed
class Budget with _$Budget {
  const factory Budget({
    @JsonKey(name: 'min_amount') required double min,
    @JsonKey(name: 'max_amount') required double max,
    required String id,
  }) = _Budget;

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);
}

@freezed
class ShoppingHabits with _$ShoppingHabits {
  const factory ShoppingHabits({
    required String frequency,
    @JsonKey(name: 'preferred_retailers')
    required List<String> preferredRetailers,
    required String id,
  }) = _ShoppingHabits;

  factory ShoppingHabits.fromJson(Map<String, dynamic> json) =>
      _$ShoppingHabitsFromJson(json);
}

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @JsonKey(name: 'receive_notifications') required bool receiveNotifications,
    @JsonKey(name: 'allow_data_sharing') required bool allowDataSharing,
    required String id,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}

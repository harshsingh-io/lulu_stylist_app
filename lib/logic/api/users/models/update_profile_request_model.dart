import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_request_model.freezed.dart';
part 'update_profile_request_model.g.dart';

@freezed
class UpdateProfileRequestModel with _$UpdateProfileRequestModel {
  const factory UpdateProfileRequestModel({
    @JsonKey(name: 'user_details') required UserDetailsRequest userDetails,
    @JsonKey(name: 'user_preferences')
    required UserPreferencesRequest userPreferences,
  }) = _UpdateProfileRequestModel;

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestModelFromJson(json);
}

@freezed
class UserDetailsRequest with _$UserDetailsRequest {
  const factory UserDetailsRequest({
    required String name,
    required int age,
    required String gender,
    @JsonKey(name: 'location_long') required String locationLong,
    @JsonKey(name: 'location_lat') required String locationLat,
    @JsonKey(name: 'body_measurements')
    required BodyMeasurementsRequest bodyMeasurements,
    @JsonKey(name: 'style_preferences')
    required StylePreferencesRequest stylePreferences,
  }) = _UserDetailsRequest;

  factory UserDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsRequestFromJson(json);
}

@freezed
class BodyMeasurementsRequest with _$BodyMeasurementsRequest {
  const factory BodyMeasurementsRequest({
    required double height,
    required double weight,
    @JsonKey(name: 'body_type') required String bodyType,
  }) = _BodyMeasurementsRequest;

  factory BodyMeasurementsRequest.fromJson(Map<String, dynamic> json) =>
      _$BodyMeasurementsRequestFromJson(json);
}

@freezed
class StylePreferencesRequest with _$StylePreferencesRequest {
  const factory StylePreferencesRequest({
    @JsonKey(name: 'favorite_colors') required List<String> favoriteColors,
    @JsonKey(name: 'preferred_brands') required List<String> preferredBrands,
    @JsonKey(name: 'lifestyle_choices') required List<String> lifestyleChoices,
    required BudgetRequest budget,
    @JsonKey(name: 'shopping_habits')
    required ShoppingHabitsRequest shoppingHabits,
  }) = _StylePreferencesRequest;

  factory StylePreferencesRequest.fromJson(Map<String, dynamic> json) =>
      _$StylePreferencesRequestFromJson(json);
}

@freezed
class BudgetRequest with _$BudgetRequest {
  const factory BudgetRequest({
    @JsonKey(name: 'min_amount') required double minAmount,
    @JsonKey(name: 'max_amount') required double maxAmount,
  }) = _BudgetRequest;

  factory BudgetRequest.fromJson(Map<String, dynamic> json) =>
      _$BudgetRequestFromJson(json);
}

@freezed
class ShoppingHabitsRequest with _$ShoppingHabitsRequest {
  const factory ShoppingHabitsRequest({
    required String frequency,
    @JsonKey(name: 'preferred_retailers')
    required List<String> preferredRetailers,
  }) = _ShoppingHabitsRequest;

  factory ShoppingHabitsRequest.fromJson(Map<String, dynamic> json) =>
      _$ShoppingHabitsRequestFromJson(json);
}

@freezed
class UserPreferencesRequest with _$UserPreferencesRequest {
  const factory UserPreferencesRequest({
    @JsonKey(name: 'receive_notifications') required bool receiveNotifications,
    @JsonKey(name: 'allow_data_sharing') required bool allowDataSharing,
  }) = _UserPreferencesRequest;

  factory UserPreferencesRequest.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesRequestFromJson(json);
}

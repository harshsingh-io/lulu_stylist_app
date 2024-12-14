import 'package:freezed_annotation/freezed_annotation.dart';

part 'wardrobe_failure.freezed.dart';

@freezed
class WardrobeFailure with _$WardrobeFailure {
  const factory WardrobeFailure.serverError([String? message]) = _ServerError;
  const factory WardrobeFailure.networkError() = _NetworkError;
  const factory WardrobeFailure.unauthorized() = _Unauthorized;
  const factory WardrobeFailure.itemNotFound() = _ItemNotFound;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/category.dart';

part 'create_wardrobe_item_request.freezed.dart';
part 'create_wardrobe_item_request.g.dart';

@freezed
class CreateWardrobeItemRequest with _$CreateWardrobeItemRequest {
  const factory CreateWardrobeItemRequest({
    required String name,
    required String description,
    required List<String> colors,
    required String brand,
    required String category,
    @JsonKey(name: 'is_favorite') required bool isFavorite,
    required double price,
    required String notes,
    required String size,
    required List<String> tags,
  }) = _CreateWardrobeItemRequest;

  factory CreateWardrobeItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateWardrobeItemRequestFromJson(json);

  // Custom toJson method to match API format
  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'colors': colors,
        'brand': brand,
        'category': category,
        'is_favorite': isFavorite,
        'price': price,
        'notes': notes,
        'size': size,
        'tags': tags,
      };
}

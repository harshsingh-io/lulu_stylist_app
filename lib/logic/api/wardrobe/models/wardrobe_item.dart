import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/category.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/tag.dart';

part 'wardrobe_item.freezed.dart';
part 'wardrobe_item.g.dart';

@freezed
class WardrobeItem with _$WardrobeItem {
  const factory WardrobeItem({
    required String id,
    required String name,
    required DateTime createdAt,
    required List<String> colors,
    required String brand,
    required Category category,
    required bool isFavorite,
    required double price,
    required String userId,
    required String imageLocalPath,
    required String imageData,
    required String notes,
    required String size,
    required List<Tag> tags,
  }) = _WardrobeItem;

  /// Connect the generated [_$UserModelFromJson] function to the `fromJson`
  /// factory.
  factory WardrobeItem.fromJson(Map<String, dynamic> json) =>
      _$WardrobeItemFromJson(json);
  const WardrobeItem._();
}

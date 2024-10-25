import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/category.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/tag.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
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
  }) = _Item;

  /// Connect the generated [_$UserModelFromJson] function to the `fromJson`
  /// factory.
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  const Item._();
}

import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/wardrobe_item.dart';

part 'look.freezed.dart';
part 'look.g.dart';

@freezed
class Look with _$Look {
  const factory Look({
    required String id,
    required List<WardrobeItem> items,
    required String name,
    required String description,
    required String lookImageData,
    required String lookWithUserImageData,
    required String userId,
  }) = _Look;

  /// Connect the generated [_$UserModelFromJson] function to the `fromJson`
  /// factory.
  factory Look.fromJson(Map<String, dynamic> json) => _$LookFromJson(json);
  const Look._();
}

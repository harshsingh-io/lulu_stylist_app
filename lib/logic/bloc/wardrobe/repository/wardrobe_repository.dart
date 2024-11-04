// lib/repositories/wardrobe_repository.dart

import 'package:lulu_stylist_app/logic/api/wardrobe/local/item.dart';

abstract class WardrobeRepository {
  Future<void> addItem(Item item);
  Future<void> removeItem(String id);
  Future<void> updateItem(Item item);
  Future<Item?> getItem(String id);
  Future<List<Item>> getAllItems();
}

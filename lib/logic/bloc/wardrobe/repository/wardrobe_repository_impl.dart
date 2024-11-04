// lib/repositories/wardrobe_repository_impl.dart

//TODO: Image file store in firebase storage and url store in firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/local/item.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/repository/wardrobe_repository.dart';

class WardrobeRepositoryImpl implements WardrobeRepository {
  final FirebaseFirestore _firestore;
  final Box<Item> _hiveBox;

  WardrobeRepositoryImpl(this._firestore, this._hiveBox);

  @override
  Future<void> addItem(Item item) async {
    // Add to Firestore
    await _firestore
        .collection('wardrobe_items')
        .doc(item.id)
        .set(item.toMap());

    // Add to Hive
    await _hiveBox.put(item.id, item);
  }

  @override
  Future<void> removeItem(String id) async {
    // Remove from Firestore
    await _firestore.collection('wardrobe_items').doc(id).delete();

    // Remove from Hive
    await _hiveBox.delete(id);
  }

  @override
  Future<void> updateItem(Item item) async {
    // Update Firestore
    await _firestore
        .collection('wardrobe_items')
        .doc(item.id)
        .update(item.toMap());

    // Update Hive
    await _hiveBox.put(item.id, item);
  }

  @override
  Future<Item?> getItem(String id) async {
    // Try fetching from Hive first
    Item? item = _hiveBox.get(id);
    if (item != null) {
      return item;
    }

    // If not in Hive, fetch from Firestore
    DocumentSnapshot doc =
        await _firestore.collection('wardrobe_items').doc(id).get();
    if (doc.exists) {
      item = Item.fromMap(doc.data() as Map<String, dynamic>);
      // Cache in Hive
      await _hiveBox.put(id, item);
      return item;
    }

    return null;
  }

  @override
  Future<List<Item>> getAllItems() async {
    // Fetch all items from Firestore
    QuerySnapshot snapshot =
        await _firestore.collection('wardrobe_items').get();
    List<Item> items = snapshot.docs
        .map((doc) => Item.fromMap(doc.data() as Map<String, dynamic>))
        .toList();

    // Cache all items in Hive
    for (var item in items) {
      await _hiveBox.put(item.id, item);
    }

    return items;
  }
}

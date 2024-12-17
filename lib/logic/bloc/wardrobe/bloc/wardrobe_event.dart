part of 'wardrobe_bloc.dart';

@freezed
class WardrobeEvent with _$WardrobeEvent {
  const factory WardrobeEvent.addItem(WardrobeItem item) = _AddItem;

  const factory WardrobeEvent.deleteItem(String itemId) = _DeleteItem;

  const factory WardrobeEvent.filterByCategory(String category) =
      _FilterByCategory;

  const factory WardrobeEvent.loadItems() = _LoadItems;

  const factory WardrobeEvent.started() = _Started;

  const factory WardrobeEvent.updateItem(String itemId, WardrobeItem item) =
      _UpdateItem;

  const factory WardrobeEvent.uploadImage(String itemId, File image) =
      _UploadImage;
}

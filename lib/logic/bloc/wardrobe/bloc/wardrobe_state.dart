part of 'wardrobe_bloc.dart';

@freezed
class WardrobeState with _$WardrobeState {
  const factory WardrobeState.initial() = _Initial;
  const factory WardrobeState.loading() = _Loading;
  const factory WardrobeState.loaded({
    required List<WardrobeItem> items,
    String? selectedCategory,
  }) = _Loaded;
  const factory WardrobeState.error(WardrobeFailure failure) = _Error;
  const factory WardrobeState.itemDeleted(String itemId) = _ItemDeleted;
  const factory WardrobeState.itemAdded(WardrobeItem item) = _ItemAdded;
}

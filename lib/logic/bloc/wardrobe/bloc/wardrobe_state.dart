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
}

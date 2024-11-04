// lib/blocs/wardrobe/wardrobe_state.dart

import 'package:equatable/equatable.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/local/item.dart';

abstract class WardrobeState extends Equatable {
  const WardrobeState();

  @override
  List<Object?> get props => [];
}

class WardrobeInitial extends WardrobeState {}

class WardrobeLoading extends WardrobeState {}

class WardrobeLoaded extends WardrobeState {
  final List<Item> items;

  const WardrobeLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class WardrobeItemLoaded extends WardrobeState {
  final Item item;

  const WardrobeItemLoaded(this.item);

  @override
  List<Object?> get props => [item];
}

class WardrobeOperationSuccess extends WardrobeState {}

class WardrobeOperationFailure extends WardrobeState {
  final String message;

  const WardrobeOperationFailure(this.message);

  @override
  List<Object?> get props => [message];
}

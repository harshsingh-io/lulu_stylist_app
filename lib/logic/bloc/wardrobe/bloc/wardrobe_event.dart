// lib/blocs/wardrobe/wardrobe_event.dart

import 'package:equatable/equatable.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/local/item.dart';

abstract class WardrobeEvent extends Equatable {
  const WardrobeEvent();

  @override
  List<Object?> get props => [];
}

class AddWardrobeItem extends WardrobeEvent {
  final Item item;

  const AddWardrobeItem(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveWardrobeItem extends WardrobeEvent {
  final String id;

  const RemoveWardrobeItem(this.id);

  @override
  List<Object?> get props => [id];
}

class UpdateWardrobeItem extends WardrobeEvent {
  final Item item;

  const UpdateWardrobeItem(this.item);

  @override
  List<Object?> get props => [item];
}

class FetchWardrobeItem extends WardrobeEvent {
  final String id;

  const FetchWardrobeItem(this.id);

  @override
  List<Object?> get props => [id];
}

class FetchAllWardrobeItems extends WardrobeEvent {}

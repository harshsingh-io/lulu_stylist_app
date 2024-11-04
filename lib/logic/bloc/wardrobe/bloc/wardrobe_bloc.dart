// lib/blocs/wardrobe/wardrobe_bloc.dart

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/bloc/wardrobe_event.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/bloc/wardrobe_state.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/repository/wardrobe_repository.dart';

class WardrobeBloc extends Bloc<WardrobeEvent, WardrobeState> {
  final WardrobeRepository _wardrobeRepository;
  late final StreamSubscription<QuerySnapshot> _firestoreSubscription;

  WardrobeBloc(this._wardrobeRepository) : super(WardrobeInitial()) {
    // Listen to Firestore changes and update Hive accordingly
    _firestoreSubscription = FirebaseFirestore.instance
        .collection('wardrobe_items')
        .snapshots()
        .listen((snapshot) {
      add(FetchAllWardrobeItems());
    });

    on<AddWardrobeItem>(_onAddWardrobeItem);
    on<RemoveWardrobeItem>(_onRemoveWardrobeItem);
    on<UpdateWardrobeItem>(_onUpdateWardrobeItem);
    on<FetchWardrobeItem>(_onFetchWardrobeItem);
    on<FetchAllWardrobeItems>(_onFetchAllWardrobeItems);
  }

  Future<void> _onAddWardrobeItem(
      AddWardrobeItem event, Emitter<WardrobeState> emit) async {
    emit(WardrobeLoading());
    try {
      await _wardrobeRepository.addItem(event.item);
      emit(WardrobeOperationSuccess());
      // Optionally, fetch all items again
      add(FetchAllWardrobeItems());
    } catch (e) {
      emit(WardrobeOperationFailure(e.toString()));
    }
  }

  Future<void> _onRemoveWardrobeItem(
      RemoveWardrobeItem event, Emitter<WardrobeState> emit) async {
    emit(WardrobeLoading());
    try {
      await _wardrobeRepository.removeItem(event.id);
      emit(WardrobeOperationSuccess());
      // Optionally, fetch all items again
      add(FetchAllWardrobeItems());
    } catch (e) {
      emit(WardrobeOperationFailure(e.toString()));
    }
  }

  Future<void> _onUpdateWardrobeItem(
      UpdateWardrobeItem event, Emitter<WardrobeState> emit) async {
    emit(WardrobeLoading());
    try {
      await _wardrobeRepository.updateItem(event.item);
      emit(WardrobeOperationSuccess());
      // Optionally, fetch all items again
      add(FetchAllWardrobeItems());
    } catch (e) {
      emit(WardrobeOperationFailure(e.toString()));
    }
  }

  Future<void> _onFetchWardrobeItem(
      FetchWardrobeItem event, Emitter<WardrobeState> emit) async {
    emit(WardrobeLoading());
    try {
      final item = await _wardrobeRepository.getItem(event.id);
      if (item != null) {
        emit(WardrobeItemLoaded(item));
      } else {
        emit(WardrobeOperationFailure('Item not found.'));
      }
    } catch (e) {
      emit(WardrobeOperationFailure(e.toString()));
    }
  }

  Future<void> _onFetchAllWardrobeItems(
      FetchAllWardrobeItems event, Emitter<WardrobeState> emit) async {
    emit(WardrobeLoading());
    try {
      final items = await _wardrobeRepository.getAllItems();
      emit(WardrobeLoaded(items));
    } catch (e) {
      emit(WardrobeOperationFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _firestoreSubscription.cancel();
    return super.close();
  }
}

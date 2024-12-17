import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/wardrobe_item.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/wardrobe_failure.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/wardrobe_repository.dart';

part 'wardrobe_event.dart';
part 'wardrobe_state.dart';
part 'wardrobe_bloc.freezed.dart';

Logger log = Logger(printer: PrettyPrinter());

class WardrobeBloc extends Bloc<WardrobeEvent, WardrobeState> {
  WardrobeBloc({required WardrobeRepository repository})
      : _repository = repository,
        super(const WardrobeState.initial()) {
    on<_Started>(_onStarted);
    on<_LoadItems>(_onLoadItems);
    on<_AddItem>(_onAddItem);
    on<_DeleteItem>(_onDeleteItem);
    on<_UpdateItem>(_onUpdateItem);
    on<_UploadImage>(_onUploadImage);
    on<_FilterByCategory>(_onFilterByCategory);
  }

  final String _logTag = 'WardrobeBloc';
  final WardrobeRepository _repository;

  Future<void> _onStarted(_Started event, Emitter<WardrobeState> emit) async {
    log.d('$_logTag _onStarted called');
    try {
      emit(const WardrobeState.loading());

      final result = await _repository.getWardrobeItems();
      result.fold(
        (failure) {
          log.e('$_logTag Failed to load wardrobe items', error: failure);
          emit(WardrobeState.error(failure));
        },
        (items) {
          log.d('$_logTag Successfully loaded ${items.length} items');
          emit(WardrobeState.loaded(items: items));
        },
      );
    } catch (e, stackTrace) {
      log.e('$_logTag Unexpected error in _onStarted',
          error: e, stackTrace: stackTrace);
      emit(WardrobeState.error(WardrobeFailure.serverError(e.toString())));
    }
  }

  Future<void> _onLoadItems(
      _LoadItems event, Emitter<WardrobeState> emit) async {
    log.d('$_logTag _onLoadItems called');
    try {
      emit(const WardrobeState.loading());

      final result = await _repository.getWardrobeItems();
      result.fold(
        (failure) {
          log.e('$_logTag Failed to load items', error: failure);
          emit(WardrobeState.error(failure));
        },
        (items) {
          log.d('$_logTag Successfully loaded ${items.length} items');
          emit(WardrobeState.loaded(items: items));
        },
      );
    } catch (e, stackTrace) {
      log.e('$_logTag Unexpected error in _onLoadItems',
          error: e, stackTrace: stackTrace);
      emit(WardrobeState.error(WardrobeFailure.serverError(e.toString())));
    }
  }

  Future<void> _onAddItem(_AddItem event, Emitter<WardrobeState> emit) async {
    log.d('$_logTag _onAddItem called');
    try {
      emit(const WardrobeState.loading());

      final result = await _repository.createWardrobeItem(event.item);
      await result.fold(
        (failure) {
          log.e('$_logTag Failed to add item', error: failure);
          emit(WardrobeState.error(failure));
        },
        (_) async {
          log.d('$_logTag Item added successfully, reloading items');
          final itemsResult = await _repository.getWardrobeItems();
          emit(itemsResult.fold(
            (failure) {
              log.e('$_logTag Failed to reload items after add',
                  error: failure);
              return WardrobeState.error(failure);
            },
            (items) {
              log.d('$_logTag Successfully reloaded ${items.length} items');
              return WardrobeState.loaded(
                items: items,
                selectedCategory: state.mapOrNull(
                  loaded: (state) => state.selectedCategory,
                ),
              );
            },
          ));
        },
      );
    } catch (e, stackTrace) {
      log.e('$_logTag Unexpected error in _onAddItem',
          error: e, stackTrace: stackTrace);
      emit(WardrobeState.error(WardrobeFailure.serverError(e.toString())));
    }
  }

  Future<void> _onDeleteItem(
      _DeleteItem event, Emitter<WardrobeState> emit) async {
    emit(const WardrobeState.loading());

    final result = await _repository.deleteWardrobeItem(event.itemId);

    result.fold(
      (failure) => emit(WardrobeState.error(failure)),
      (_) async {
        final itemsResult = await _repository.getWardrobeItems();
        emit(itemsResult.fold(
          (failure) => WardrobeState.error(failure),
          (items) => WardrobeState.loaded(
            items: items,
            selectedCategory: state.mapOrNull(
              loaded: (state) => state.selectedCategory,
            ),
          ),
        ));
      },
    );
  }

  Future<void> _onUpdateItem(
      _UpdateItem event, Emitter<WardrobeState> emit) async {
    emit(const WardrobeState.loading());

    final result =
        await _repository.updateWardrobeItem(event.itemId, event.item);

    result.fold(
      (failure) => emit(WardrobeState.error(failure)),
      (_) async {
        final itemsResult = await _repository.getWardrobeItems();
        emit(itemsResult.fold(
          (failure) => WardrobeState.error(failure),
          (items) => WardrobeState.loaded(
            items: items,
            selectedCategory: state.mapOrNull(
              loaded: (state) => state.selectedCategory,
            ),
          ),
        ));
      },
    );
  }

  Future<void> _onUploadImage(
      _UploadImage event, Emitter<WardrobeState> emit) async {
    emit(const WardrobeState.loading());

    final result = await _repository.uploadItemImage(event.itemId, event.image);

    result.fold(
      (failure) => emit(WardrobeState.error(failure)),
      (_) async {
        final itemsResult = await _repository.getWardrobeItems();
        emit(itemsResult.fold(
          (failure) => WardrobeState.error(failure),
          (items) => WardrobeState.loaded(
            items: items,
            selectedCategory: state.mapOrNull(
              loaded: (state) => state.selectedCategory,
            ),
          ),
        ));
      },
    );
  }

  Future<void> _onFilterByCategory(
      _FilterByCategory event, Emitter<WardrobeState> emit) async {
    emit(const WardrobeState.loading());

    final result = await _repository.getWardrobeItems();

    emit(result.fold(
      (failure) => WardrobeState.error(failure),
      (items) => WardrobeState.loaded(
        items: event.category.isEmpty
            ? items
            : items.where((item) => item.category == event.category).toList(),
        selectedCategory: event.category,
      ),
    ));
  }
}

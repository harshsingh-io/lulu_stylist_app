import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/category.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/create_wardrobe_item_request.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/wardrobe_item.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/wardrobe_failure.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/wardrobe_repository.dart';

part 'wardrobe_event.dart';
part 'wardrobe_state.dart';
part 'wardrobe_bloc.freezed.dart';

Logger log = Logger(printer: PrettyPrinter());

class WardrobeBloc extends Bloc<WardrobeEvent, WardrobeState> {
  WardrobeBloc({
    required WardrobeRepository repository,
    required AuthenticationBloc authBloc,
  })  : _repository = repository,
        _authBloc = authBloc,
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
  final AuthenticationBloc _authBloc;

  String? _getAuthToken() {
    return _authBloc.state.maybeWhen(
      userLoggedIn: (user, token) => token,
      userAuthenticated: (user, token) => token,
      userNeedsProfileDetails: (user, token) => token,
      orElse: () => null,
    );
  }

  void _handleUnauthorized() {
    _authBloc.add(const AuthenticationEvent.sessionExpired());
  }

  Future<void> _onLoadItems(
    _LoadItems event,
    Emitter<WardrobeState> emit,
  ) async {
    log.d('$_logTag _onLoadItems called');
    try {
      emit(const WardrobeState.loading());

      final token = _getAuthToken();
      if (token == null) {
        emit(WardrobeState.error(const WardrobeFailure.unauthorized()));
        _handleUnauthorized();
        return;
      }

      final results = await Future.wait(
        Category.values.map(
          (category) => _repository.getWardrobeItems(
            token,
            category: category,
          ),
        ),
      );

      final Map<Category, List<WardrobeItem>> itemsByCategory = {};
      var hasError = false;

      for (var i = 0; i < results.length; i++) {
        final result = results[i];
        final category = Category.values[i];

        await result.fold(
          (failure) async {
            hasError = true;
            log.e('$_logTag Failed to load items for category $category',
                error: failure);
            if (failure.maybeWhen(
              unauthorized: () => true,
              orElse: () => false,
            )) {
              _handleUnauthorized();
            }
          },
          (items) async {
            itemsByCategory[category] = items;
          },
        );
      }

      if (hasError && itemsByCategory.isEmpty) {
        emit(WardrobeState.error(const WardrobeFailure.serverError()));
      } else {
        emit(WardrobeState.loaded(
          items: itemsByCategory.values.expand((items) => items).toList(),
          selectedCategory: state.mapOrNull(
            loaded: (state) => state.selectedCategory,
          ),
        ));
      }
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

      final token = _getAuthToken();
      if (token == null) {
        emit(WardrobeState.error(const WardrobeFailure.unauthorized()));
        _handleUnauthorized();
        return;
      }

      final result = await _repository.createWardrobeItem(token, event.item);
      await result.fold(
        (failure) async {
          log.e('$_logTag Failed to add item', error: failure);
          if (failure.maybeWhen(
            unauthorized: () => true,
            orElse: () => false,
          )) {
            _handleUnauthorized();
          }
          emit(WardrobeState.error(failure));
        },
        (newItem) async {
          log.d('$_logTag Item added successfully, reloading items');
          final itemsResult = await _repository.getWardrobeItems(
            token,
            category: newItem.category,
          );

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
    _DeleteItem event,
    Emitter<WardrobeState> emit,
  ) async {
    log.d('$_logTag _onDeleteItem called');
    try {
      emit(const WardrobeState.loading());

      final token = _getAuthToken();
      if (token == null) {
        emit(WardrobeState.error(const WardrobeFailure.unauthorized()));
        _handleUnauthorized();
        return;
      }

      // Get item's category before deletion
      final itemResult = await _repository.getWardrobeItem(token, event.itemId);

      final category = await itemResult.fold(
        (failure) => Category.TOP, // Default to TOP if fetch fails
        (item) => item.category,
      );

      final deleteResult =
          await _repository.deleteWardrobeItem(token, event.itemId);

      await deleteResult.fold(
        (failure) async {
          if (failure.maybeWhen(
            unauthorized: () => true,
            orElse: () => false,
          )) {
            _handleUnauthorized();
          }
          emit(WardrobeState.error(failure));
        },
        (_) async {
          final itemsResult =
              await _repository.getWardrobeItems(token, category: category);

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
    } catch (e) {
      emit(WardrobeState.error(WardrobeFailure.serverError(e.toString())));
    }
  }

  Future<void> _onUpdateItem(
    _UpdateItem event,
    Emitter<WardrobeState> emit,
  ) async {
    log.d('$_logTag _onUpdateItem called');
    try {
      emit(const WardrobeState.loading());

      final token = _getAuthToken();
      if (token == null) {
        emit(WardrobeState.error(const WardrobeFailure.unauthorized()));
        _handleUnauthorized();
        return;
      }

      final result = await _repository.updateWardrobeItem(
        token,
        event.itemId,
        event.item,
      );

      await result.fold(
        (failure) async {
          log.e('$_logTag Failed to update item', error: failure);
          if (failure.maybeWhen(
            unauthorized: () => true,
            orElse: () => false,
          )) {
            _handleUnauthorized();
          }
          emit(WardrobeState.error(failure));
        },
        (updatedItem) async {
          log.d('$_logTag Item updated successfully, reloading items');
          final itemsResult = await _repository.getWardrobeItems(
            token,
            category: updatedItem.category,
          );

          emit(itemsResult.fold(
            (failure) {
              log.e('$_logTag Failed to reload items after update',
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
      log.e('$_logTag Unexpected error in _onUpdateItem',
          error: e, stackTrace: stackTrace);
      emit(WardrobeState.error(WardrobeFailure.serverError(e.toString())));
    }
  }

  Future<void> _onUploadImage(
    _UploadImage event,
    Emitter<WardrobeState> emit,
  ) async {
    log.d('$_logTag _onUploadImage called');
    try {
      emit(const WardrobeState.loading());

      final token = _getAuthToken();
      if (token == null) {
        emit(WardrobeState.error(const WardrobeFailure.unauthorized()));
        _handleUnauthorized();
        return;
      }

      final result = await _repository.uploadItemImage(
        token,
        event.itemId,
        event.image,
      );

      await result.fold(
        (failure) async {
          log.e('$_logTag Failed to upload image', error: failure);
          if (failure.maybeWhen(
            unauthorized: () => true,
            orElse: () => false,
          )) {
            _handleUnauthorized();
          }
          emit(WardrobeState.error(failure));
        },
        (updatedItem) async {
          log.d('$_logTag Image uploaded successfully, reloading items');
          final itemsResult = await _repository.getWardrobeItems(
            token,
            category: updatedItem.category,
          );

          emit(itemsResult.fold(
            (failure) {
              log.e('$_logTag Failed to reload items after image upload',
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
      log.e('$_logTag Unexpected error in _onUploadImage',
          error: e, stackTrace: stackTrace);
      emit(WardrobeState.error(WardrobeFailure.serverError(e.toString())));
    }
  }

  Future<void> _onFilterByCategory(
    _FilterByCategory event,
    Emitter<WardrobeState> emit,
  ) async {
    log.d('$_logTag _onFilterByCategory called');
    try {
      emit(const WardrobeState.loading());

      final token = _getAuthToken();
      if (token == null) {
        emit(WardrobeState.error(const WardrobeFailure.unauthorized()));
        _handleUnauthorized();
        return;
      }

      final result = await _repository.getWardrobeItems(
        token,
        category: event.category,
      );

      emit(result.fold(
        (failure) {
          log.e('$_logTag Failed to filter items by category', error: failure);
          if (failure.maybeWhen(
            unauthorized: () => true,
            orElse: () => false,
          )) {
            _handleUnauthorized();
          }
          return WardrobeState.error(failure);
        },
        (items) {
          log.d('$_logTag Successfully filtered ${items.length} items');
          return WardrobeState.loaded(
            items: items,
            selectedCategory: event.category.toString(),
          );
        },
      ));
    } catch (e, stackTrace) {
      log.e('$_logTag Unexpected error in _onFilterByCategory',
          error: e, stackTrace: stackTrace);
      emit(WardrobeState.error(WardrobeFailure.serverError(e.toString())));
    }
  }

  Future<void> _onStarted(_Started event, Emitter<WardrobeState> emit) async {
    await _onLoadItems(const _LoadItems(), emit);
  }
}

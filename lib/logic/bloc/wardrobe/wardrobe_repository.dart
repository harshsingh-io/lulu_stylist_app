import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/category.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/create_wardrobe_item_request.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/wardrobe_item.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/wardrobe_api.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/wardrobe_failure.dart';

class WardrobeRepository {
  WardrobeRepository({
    required String baseUrl,
    Dio? dioClient,
    WardrobeApi? wardrobeApi,
  })  : dio = dioClient ?? Dio(BaseOptions(baseUrl: baseUrl)),
        _wardrobeApi = wardrobeApi ??
            WardrobeApi(dioClient ?? Dio(BaseOptions(baseUrl: baseUrl)));

  final Dio dio;
  final WardrobeApi _wardrobeApi;
  final Logger log = Logger(printer: PrettyPrinter());

  String _getAuthHeader(String token) => 'Bearer $token';

  Future<Either<WardrobeFailure, List<WardrobeItem>>> getWardrobeItems(
    String token, {
    required Category category,
    int skip = 0,
    int limit = 100,
  }) async {
    try {
      final items = await _wardrobeApi.getWardrobeItems(
        _getAuthHeader(token),
        category,
        skip: skip,
        limit: limit,
      );
      return right(items);
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout) {
          return left(const WardrobeFailure.networkError());
        }
        if (e.response?.statusCode == 401) {
          return left(const WardrobeFailure.unauthorized());
        }
        // Safely handle potentially null message
        return left(
            WardrobeFailure.serverError(e.message ?? 'Unknown server error'));
      }
      // Handle general exceptions
      return left(WardrobeFailure.serverError(e.toString()));
    }
  }

  Future<Either<WardrobeFailure, WardrobeItem>> createWardrobeItem(
    String token,
    CreateWardrobeItemRequest request,
  ) async {
    try {
      log.d('Creating wardrobe item with request:', error: request.toJson());

      final item = await _wardrobeApi.createWardrobeItem(
        _getAuthHeader(token),
        request,
      );

      log.d('Item created successfully:', error: item.toJson());
      return right(item);
    } on DioException catch (e) {
      log.e('Create wardrobe item failed', error: {
        'status': e.response?.statusCode,
        'data': e.response?.data,
        'request': request.toJson(),
      });

      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const WardrobeFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const WardrobeFailure.unauthorized());
      }
      return left(WardrobeFailure.serverError(
        e.response?.data['detail'] as String? ?? e.message,
      ));
    } catch (e) {
      log.e('Unexpected error creating wardrobe item', error: e);
      return left(WardrobeFailure.serverError(e.toString()));
    }
  }

  Future<Either<WardrobeFailure, WardrobeItem>> getWardrobeItem(
    String token,
    String itemId,
  ) async {
    try {
      final item = await _wardrobeApi.getWardrobeItem(
        _getAuthHeader(token),
        itemId,
      );
      return right(item);
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout) {
          return left(const WardrobeFailure.networkError());
        }
        if (e.response?.statusCode == 401) {
          return left(const WardrobeFailure.unauthorized());
        }
        // Safely handle potentially null message
        return left(
            WardrobeFailure.serverError(e.message ?? 'Unknown server error'));
      }
      // Handle general exceptions
      return left(WardrobeFailure.serverError(e.toString()));
    }
  }

  Future<Either<WardrobeFailure, WardrobeItem>> updateWardrobeItem(
    String token,
    String itemId,
    WardrobeItem itemData,
  ) async {
    try {
      final item = await _wardrobeApi.updateWardrobeItem(
        _getAuthHeader(token),
        itemId,
        itemData,
      );
      return right(item);
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout) {
          return left(const WardrobeFailure.networkError());
        }
        if (e.response?.statusCode == 401) {
          return left(const WardrobeFailure.unauthorized());
        }
        // Safely handle potentially null message
        return left(
            WardrobeFailure.serverError(e.message ?? 'Unknown server error'));
      }
      // Handle general exceptions
      return left(WardrobeFailure.serverError(e.toString()));
    }
  }

  Future<Either<WardrobeFailure, Unit>> deleteWardrobeItem(
    String token,
    String itemId,
  ) async {
    try {
      await _wardrobeApi.deleteWardrobeItem(itemId, _getAuthHeader(token));
      return right(unit);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const WardrobeFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const WardrobeFailure.unauthorized());
      }
      if (e.response?.statusCode == 404) {
        return left(const WardrobeFailure.itemNotFound());
      }
      return left(
          WardrobeFailure.serverError(e.message ?? 'Delete request failed'));
    } catch (e) {
      return left(WardrobeFailure.serverError(e.toString()));
    }
  }

  Future<Either<WardrobeFailure, WardrobeItem>> uploadItemImage(
    String token,
    String itemId,
    File image,
  ) async {
    try {
      final item = await _wardrobeApi.uploadItemImage(
        itemId,
        image,
        _getAuthHeader(token),
      );
      return right(item);
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout) {
          return left(const WardrobeFailure.networkError());
        }
        if (e.response?.statusCode == 401) {
          return left(const WardrobeFailure.unauthorized());
        }
        // Safely handle potentially null message
        return left(
            WardrobeFailure.serverError(e.message ?? 'Unknown server error'));
      }
      // Handle general exceptions
      return left(WardrobeFailure.serverError(e.toString()));
    }
  }
}

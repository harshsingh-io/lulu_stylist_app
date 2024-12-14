import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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

  Future<Either<WardrobeFailure, List<WardrobeItem>>> getWardrobeItems() async {
    try {
      final items = await _wardrobeApi.getWardrobeItems();
      return right(items);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const WardrobeFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const WardrobeFailure.unauthorized());
      }
      return left(WardrobeFailure.serverError(e.message));
    } catch (e) {
      return left(WardrobeFailure.serverError(e.toString()));
    }
  }

  Future<Either<WardrobeFailure, WardrobeItem>> createWardrobeItem(
      WardrobeItem itemData) async {
    try {
      final item = await _wardrobeApi.createWardrobeItem(itemData);
      return right(item);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const WardrobeFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const WardrobeFailure.unauthorized());
      }
      return left(WardrobeFailure.serverError(e.message));
    } catch (e) {
      return left(WardrobeFailure.serverError(e.toString()));
    }
  }

  Future<Either<WardrobeFailure, WardrobeItem>> getWardrobeItem(
      String itemId) async {
    try {
      final item = await _wardrobeApi.getWardrobeItem(itemId);
      return right(item);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const WardrobeFailure.networkError());
      }
      if (e.response?.statusCode == 404) {
        return left(const WardrobeFailure.itemNotFound());
      }
      if (e.response?.statusCode == 401) {
        return left(const WardrobeFailure.unauthorized());
      }
      return left(WardrobeFailure.serverError(e.message));
    } catch (e) {
      return left(WardrobeFailure.serverError(e.toString()));
    }
  }

  Future<Either<WardrobeFailure, WardrobeItem>> updateWardrobeItem(
      String itemId, WardrobeItem itemData) async {
    try {
      final item = await _wardrobeApi.updateWardrobeItem(itemId, itemData);
      return right(item);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const WardrobeFailure.networkError());
      }
      if (e.response?.statusCode == 404) {
        return left(const WardrobeFailure.itemNotFound());
      }
      if (e.response?.statusCode == 401) {
        return left(const WardrobeFailure.unauthorized());
      }
      return left(WardrobeFailure.serverError(e.message));
    } catch (e) {
      return left(WardrobeFailure.serverError(e.toString()));
    }
  }

  Future<Either<WardrobeFailure, Unit>> deleteWardrobeItem(
      String itemId) async {
    try {
      await _wardrobeApi.deleteWardrobeItem(itemId);
      return right(unit);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const WardrobeFailure.networkError());
      }
      if (e.response?.statusCode == 404) {
        return left(const WardrobeFailure.itemNotFound());
      }
      if (e.response?.statusCode == 401) {
        return left(const WardrobeFailure.unauthorized());
      }
      return left(WardrobeFailure.serverError(e.message));
    } catch (e) {
      return left(WardrobeFailure.serverError(e.toString()));
    }
  }

  Future<Either<WardrobeFailure, WardrobeItem>> uploadItemImage(
      String itemId, File image) async {
    try {
      final item = await _wardrobeApi.uploadItemImage(itemId, image);
      return right(item);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const WardrobeFailure.networkError());
      }
      if (e.response?.statusCode == 404) {
        return left(const WardrobeFailure.itemNotFound());
      }
      if (e.response?.statusCode == 401) {
        return left(const WardrobeFailure.unauthorized());
      }
      return left(WardrobeFailure.serverError(e.message));
    } catch (e) {
      return left(WardrobeFailure.serverError(e.toString()));
    }
  }
}

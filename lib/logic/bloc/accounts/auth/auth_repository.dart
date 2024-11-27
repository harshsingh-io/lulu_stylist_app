// lib/repositories/auth_repository.dart
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lulu_stylist_app/logic/api/auth/authentication_inceptor.dart';
import 'package:lulu_stylist_app/logic/api/auth/model/auth_failure.dart';
import 'package:lulu_stylist_app/logic/api/auth/model/token_pair.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';

class AuthRepository {
  AuthRepository({
    required String baseUrl,
    Dio? dioClient,
    FlutterSecureStorage? secureStorage,
  })  : dio = dioClient ?? Dio(BaseOptions(baseUrl: baseUrl)),
        storage = secureStorage ?? const FlutterSecureStorage() {
    dio.interceptors.add(AuthInterceptor(this, dio));
  }
  final Dio dio;
  final FlutterSecureStorage storage;
  final _sessionExpiredController = StreamController<void>.broadcast();

  Stream<void> get sessionExpired => _sessionExpiredController.stream;

  // Add these getter methods
  Future<String?> getAccessToken() => storage.read(key: 'access_token');
  Future<String?> getRefreshToken() => storage.read(key: 'refresh_token');

  void notifySessionExpired() {
    _sessionExpiredController.add(null);
  }

  Future<Either<AuthFailure, TokenPair>> login({
    required String email,
    required String password,
  }) async {
    try {
      final formData = FormData.fromMap({
        'username': email,
        'password': password,
      });

      final response = await dio.post(
        '/login',
        data: formData,
      );

      if (response.statusCode == 200) {
        final tokenPair =
            TokenPair.fromJson(response.data as Map<String, dynamic>);
        await saveTokens(tokenPair);
        return right(tokenPair);
      } else {
        return left(const AuthFailure.serverError());
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left(const AuthFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const AuthFailure.invalidCredentials());
      }
      return left(AuthFailure.serverError(e.message));
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  Future<Either<AuthFailure, TokenPair>> refreshTokens(
    String refreshToken,
  ) async {
    try {
      final response = await dio.post(
        '/refresh',
        options: Options(
          headers: {'Authorization': 'Bearer $refreshToken'},
        ),
      );

      if (response.statusCode == 200) {
        final tokenPair =
            TokenPair.fromJson(response.data as Map<String, dynamic>);
        await saveTokens(tokenPair);
        return right(tokenPair);
      } else {
        return left(const AuthFailure.tokenExpired());
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const AuthFailure.networkError());
      }
      return left(const AuthFailure.tokenExpired());
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  Future<Either<AuthFailure, Unit>> logout() async {
    try {
      final accessToken = await getAccessToken();
      if (accessToken != null) {
        await dio.post(
          '/logout',
          options: Options(
            headers: {'Authorization': 'Bearer $accessToken'},
          ),
        );
      }
      await clearTokens();
      return right(unit);
    } catch (e) {
      // Still clear tokens even if logout request fails
      await clearTokens();
      return left(const AuthFailure.serverError());
    }
  }

  Future<Either<AuthFailure, UserModel>> getCurrentUser() async {
    try {
      final accessToken = await getAccessToken();
      if (accessToken == null) {
        return left(const AuthFailure.tokenExpired());
      }

      final response = await dio.get(
        '/users/me',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );

      if (response.statusCode == 200) {
        return right(UserModel.fromJson(response.data as Map<String, dynamic>));
      } else {
        return left(const AuthFailure.serverError());
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(const AuthFailure.tokenExpired());
      }
      return left(const AuthFailure.serverError());
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  Future<Either<AuthFailure, TokenPair>> getStoredTokens() async {
    try {
      final accessToken = await getAccessToken();
      final refreshToken = await getRefreshToken();
      final tokenType = await storage.read(key: 'token_type');

      if (accessToken == null || refreshToken == null || tokenType == null) {
        return left(const AuthFailure.tokenExpired());
      }

      return right(
        TokenPair(
          accessToken: accessToken,
          refreshToken: refreshToken,
          tokenType: tokenType,
        ),
      );
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  Future<void> saveTokens(TokenPair tokens) async {
    await storage.write(key: 'access_token', value: tokens.accessToken);
    await storage.write(key: 'refresh_token', value: tokens.refreshToken);
    await storage.write(key: 'token_type', value: tokens.tokenType);
  }

  Future<void> clearTokens() async {
    await storage.delete(key: 'access_token');
    await storage.delete(key: 'refresh_token');
    await storage.delete(key: 'token_type');
  }

  void dispose() {
    _sessionExpiredController.close();
  }
}

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/auth/model/auth_failure.dart';
import 'package:lulu_stylist_app/logic/api/users/models/update_profile_request_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:lulu_stylist_app/logic/api/users/user_api.dart';
import 'package:lulu_stylist_app/logic/api_base.dart';

class UserRepository {
  final UserApi _userApi;
  final Logger log = Logger(printer: PrettyPrinter());

  UserRepository({
    required String baseUrl,
    Dio? dioClient,
  }) : _userApi = UserApi(dioClient ??
            Dio(BaseOptions(
              baseUrl: baseUrl,
              validateStatus: (status) => true,
              contentType: 'application/json',
              headers: {
                'Accept': 'application/json',
              },
            )));

  Future<Either<AuthFailure, UserModel>> updateUserProfile(
    String accessToken,
    UpdateProfileRequestModel userData,
  ) async {
    try {
      log.d('Making update profile request', error: {
        'token': 'Bearer $accessToken',
        'body': userData.toJson(),
      });

      if (accessToken.isEmpty) {
        return left(const AuthFailure.tokenExpired());
      }

      final updatedUser = await _userApi.updateUser(
        'Bearer $accessToken',
        userData,
      );

      log.d('Update profile successful', error: {
        'updatedUser': updatedUser.toJson(),
      });

      return right(updatedUser);
    } on DioException catch (e) {
      log.e('Profile update failed', error: {
        'type': e.type,
        'error': e.error,
        'message': e.message,
        'response': e.response?.data,
        'path': e.requestOptions.path,
        'method': e.requestOptions.method,
        'headers': e.requestOptions.headers,
      });

      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const AuthFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const AuthFailure.tokenExpired());
      }
      return left(AuthFailure.serverError(e.message));
    } catch (e) {
      log.e('Unexpected error during profile update', error: e);
      return left(AuthFailure.serverError(e.toString()));
    }
  }

  Future<Either<AuthFailure, UserModel>> getCurrentUser(
      String accessToken) async {
    try {
      log.d('Getting current user', error: {
        'token': 'Bearer $accessToken',
      });

      final user = await _userApi.getMe('Bearer $accessToken');
      return right(user);
    } on DioException catch (e) {
      log.e('Get user failed', error: {
        'type': e.type,
        'error': e.error,
        'message': e.message,
        'response': e.response?.data,
      });

      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const AuthFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const AuthFailure.tokenExpired());
      }
      return left(AuthFailure.serverError(e.message));
    } catch (e) {
      log.e('Unexpected error getting user', error: e);
      // Changed this line to use null-safe string conversion
      return left(AuthFailure.serverError(e.toString()));
    }
  }

  Future<Either<AuthFailure, String>> uploadProfilePicture(
    String accessToken,
    File imageFile,
  ) async {
    try {
      log.d('Uploading profile picture', error: {
        'token': 'Bearer $accessToken',
        'fileName': imageFile.path,
      });

      if (accessToken.isEmpty) {
        return left(const AuthFailure.tokenExpired());
      }

      final photoUrl = await _userApi.uploadProfilePicture(
        'Bearer $accessToken',
        imageFile,
      );

      log.d('Profile picture upload successful', error: {
        'photoUrl': photoUrl,
      });

      return right(photoUrl);
    } on DioException catch (e) {
      log.e('Profile picture upload failed', error: {
        'type': e.type,
        'error': e.error,
        'message': e.message,
        'response': e.response?.data,
      });

      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const AuthFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const AuthFailure.tokenExpired());
      }
      return left(AuthFailure.serverError(e.message));
    } catch (e) {
      log.e('Unexpected error during profile picture upload', error: e);
      return left(AuthFailure.serverError(e.toString()));
    }
  }
}

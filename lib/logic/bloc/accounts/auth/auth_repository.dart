import 'dart:convert';

import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_device_token_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:lulu_stylist_app/logic/api/users/user_api.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class AuthRepository {
  AuthRepository({
    required this.userApi,
  });

  final String _logTag = 'AuthRepository';
  final authTokenkey = 'authToken';
  final authUserKey = 'authUser';
  final expertUserKey = 'expertUser';

  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );
  final UserApi userApi;

  Future<void> logout() async {
    final userDeviceToken = UserDeviceTokenModel(
      deviceToken: await AwesomeNotificationsFcm().requestFirebaseAppToken(),
    );

    log.d('Device Token While Logging Out : $userDeviceToken');
    if (AuthenticationBloc().isAuthUser()) {
      try {
        await userApi.logout(userDeviceToken);
      } catch (e) {
        log
          ..e('Error in Logout user : $e')
          ..e('Device Token is : $userDeviceToken');
      }
    }
    await _storage.delete(key: authTokenkey);
    await _storage.delete(key: authUserKey);
    await _storage.delete(key: expertUserKey);
    /* Logout for deleting the auth token from the backend */
  }

  Future<String?> getAuthToken() async {
    final authToken = await _storage.read(key: authTokenkey);
    log.d(_logTag, error: 'Returning the authToken : $authToken');
    return authToken;
  }

  Future<UserModel?> getAuthUser() async {
    final data = await _storage.read(key: authUserKey);
    if (data != null) {
      final userData = jsonDecode(data);
      try {
        final user = UserModel.fromJson(userData as Map<String, dynamic>);
        log.d(_logTag, error: 'Returning the user : $user');
        return user;
      } on Exception catch (e) {
        // Anything else that is an exception
        log.e(
          _logTag,
          error: 'Exception converting to user:  userString: $data $e',
        );
      }
    }

    return null;
  }

  Future<String?> setAuthToken(String authToken) async {
    await _storage.write(key: authTokenkey, value: authToken);
    return _storage.read(key: authTokenkey);
  }

  Future<UserModel?> setUser(UserModel user) async {
    await _storage.write(
      key: authUserKey,
      value: jsonEncode(user.toJson()),
    );
    return getAuthUser();
  }
}

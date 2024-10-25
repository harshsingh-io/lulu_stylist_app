import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_update_request_model.dart';
import 'package:lulu_stylist_app/logic/api/users/user_api.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class UserRepository {
  const UserRepository(this._api);
  final UserApi _api;

  Future<UserUpdateRequestModel?> updateUserProfile(
    UserUpdateRequestModel updateUserModelRequest,
  ) async {
    //TODO UPDATE USER IMAGE TO BACKEND
    // UserUpdateRequestModel? userUpdateRequestModelWithPath;
    // if (imageFile != null) {

    //   final uploadPhotoModel = await _api.getPhotoUploadUrl();
    //   final uploadPath = uploadPhotoModel.path; // This is the current path
    //   print('path is $uploadPath');

    //   final headers = {'Content-Type': 'image/jpg'};
    //   final List<int> imageBytes = await imageFile.readAsBytes();

    //   final dio = Dio();
    //   final responsePhotoUpload = await dio.request(
    //     uploadPhotoModel.postUrl,
    //     options: Options(
    //       method: 'POST',
    //       headers: headers,
    //     ),
    //     data: imageBytes,
    //   );

    //   if (responsePhotoUpload.statusCode == 200) {
    //     // Handle successful photo upload
    //     userUpdateRequestModelWithPath =
    //         updateUserModelRequest.copyWith(path: uploadPath);
    //     log.d('photo Uploaded');
    //   } else {
    //     // Handle unsuccessful photo upload
    //     log.e('There is an error in photoUpload');
    //   }
    // }

    try {
      final response = await _api.updateUser(updateUserModelRequest);
      return response;
    } catch (e) {
      log.e('An error occurred while updating user: $e');
      return null; // Return null if an error occurs
    }
  }
}

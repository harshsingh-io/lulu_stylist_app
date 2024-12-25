import 'package:dio/dio.dart';
import 'package:lulu_stylist_app/logic/api/users/models/update_profile_request_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/upload_photo_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_device_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

// user_api.dart
@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  static String getErrorMessage(DioException e) {
    final dynamic detail = e.response?.data?['detail'];
    return detail?.toString() ?? e.message ?? 'Unknown error occurred';
  }

  @GET('/users/devices')
  Future<List<UserDeviceModel>> getDevices();

  @POST('/users/devices')
  Future<List<UserDeviceModel>> addDevice(
    @Body() String deviceToken,
    @Body() String platform,
  );

  @GET('/users/devices/{id}')
  Future<List<UserDeviceModel>> getDevice(
    @Path('id') String deviceId,
  );

  @DELETE('/users/devices/{id}')
  Future<List<UserDeviceModel>> deleteDevice(
    @Path('id') String deviceId,
  );

  @GET('/api/users/me')
  Future<UserModel> getMe(@Header('Authorization') String token);

  @GET('/users/photo_url')
  Future<UploadPhotoModel> getPhotoUploadUrl();

  @PUT('/api/users/me/profile')
  Future<UserModel> updateUser(
    @Header('Authorization') String token,
    @Body() UpdateProfileRequestModel updateUserRequestModel,
  );
}

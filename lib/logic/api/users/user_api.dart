import 'package:dio/dio.dart';
import 'package:lulu_stylist_app/logic/api/common/models/login_request_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/loggedin_user_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/upload_photo_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_device_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_device_token_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_update_request_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  @POST('/users/login/start')
  Future<bool> sendOtp(
    String phone,
  );

  @POST('/users/login')
  Future<LoggedInUserModel> loginUser(
    @Body() LoginRequestModel request,
  );

  @POST('/users/logout')
  Future<void> logout(
    @Body() UserDeviceTokenModel deviceToken,
  );

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

  @GET('/users/me')
  Future<UserModel> getMe();

  @GET('/users/photo_url')
  Future<UploadPhotoModel> getPhotoUploadUrl();

  @POST('/users')
  Future<UserModel> updateUser(
    @Body() UserUpdateRequestModel updateUserRequestModel,
  );
}

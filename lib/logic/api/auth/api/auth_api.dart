import 'package:dio/dio.dart';
import 'package:lulu_stylist_app/logic/api/auth/model/auth_token_model.dart';
import 'package:lulu_stylist_app/logic/api/auth/model/user_register_model.dart';
import 'package:lulu_stylist_app/logic/api/common/models/login_request_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/loggedin_user_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/upload_photo_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_device_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_device_token_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_update_request_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST('/api/register')
  Future<UserModel> registerUser(
    @Body() UserRegisterModel request,
  );
  @POST('/api/login')
  @FormUrlEncoded() // Add this
  Future<AuthTokenModel> loginUser(
      @Field('username') String username, @Field('password') String password,
      {@Field('grant_type') String? grantType,
      @Field('scope') String? scope,
      @Field('client_id') String? clientId,
      @Field('client_secret') String? clientSecret});
  @POST('/api/refresh')
  Future<AuthTokenModel> refreshToken(
    String refreshToken,
  );
  @POST('/api/logout')
  Future<String> logout();
}

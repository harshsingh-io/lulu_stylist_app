import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/auth/model/auth_token_model.dart';
import 'package:lulu_stylist_app/logic/api/auth/model/user_register_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/loggedin_user_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

Logger log = Logger(printer: PrettyPrinter());

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  static const String _logTag = 'AuthApi';

  @POST('/api/register')
  Future<UserModel> registerUser(
    @Body() UserRegisterModel request,
  );

  @POST('/api/login')
  @FormUrlEncoded()
  Future<AuthTokenModel> loginUser(
    @Field('username') String username,
    @Field('password') String password, {
    @Field('grant_type') String? grantType,
    @Field('scope') String? scope,
    @Field('client_id') String? clientId,
    @Field('client_secret') String? clientSecret,
  });

  @POST('/api/refresh')
  @FormUrlEncoded()
  Future<AuthTokenModel> refreshToken(
    @Field('refresh_token') String refreshToken,
  );

  @POST('/api/logout')
  Future<void> logout();

  @GET('/api/users/me')
  Future<UserModel> getCurrentUser(
    @Header('Authorization') String bearerToken,
  );

  // Helper method to validate tokens from API response
  static bool validateTokenResponse(AuthTokenModel response) {
    log.d('$_logTag Validating token response');
    return response.accessToken.isNotEmpty && response.refreshToken.isNotEmpty;
  }

  // Helper method to format bearer token
  static String formatBearerToken(String token) => 'Bearer $token';

  // Helper method to handle API errors
  static String getErrorMessage(DioException e) {
    if (e.response?.data != null && e.response?.data['detail'] != null) {
      return e.response?.data['detail'] as String;
    }
    return e.message ?? 'An unexpected error occurred';
  }
}

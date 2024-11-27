// lib/services/auth_interceptor.dart
import 'package:dio/dio.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/auth_repository.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.authRepository, this.dio);
  final AuthRepository authRepository;
  final Dio dio;
  bool _isRefreshing = false;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await authRepository.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 403 && !_isRefreshing) {
      _isRefreshing = true;
      try {
        final refreshToken = await authRepository.getRefreshToken();
        if (refreshToken != null) {
          await authRepository.refreshTokens(refreshToken);
          // Retry the failed request
          final response = await _retryRequest(err.requestOptions);
          _isRefreshing = false;
          return handler.resolve(response);
        }
      } catch (e) {
        _isRefreshing = false;
      }
    }
    return handler.next(err);
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    final accessToken = await authRepository.getAccessToken();
    requestOptions.headers['Authorization'] = 'Bearer $accessToken';

    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}

import 'package:dio/dio.dart';
import 'package:dio_brotli_transformer/dio_brotli_transformer.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lulu_stylist_app/logic/api_base.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory({this.baseUrl = apiBase});

  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  final String baseUrl;

  Future<String?> getAuthToken() {
    return _storage.read(key: 'authToken');
  }

  Dio create() {
    final dio = Dio(_createBaseOptions());

    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        compact: false,
      ),
    );

    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print, // specify log function
        retries: 1, // retry count
        retryDelays: const [
          Duration.zero, // wait 1 sec before first retry
          // Duration(seconds: 2), // wait 2 sec before second retry
          // Duration(seconds: 3), // wait 3 sec before third retry
        ],
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final authToken = await getAuthToken();
          if (authToken != null) {
            options.headers['Authorization'] = 'Bearer $authToken';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          // todo: will finish this
          return handler.next(error);
        },
      ),
    );

    dio.transformer = DioBrotliTransformer();

    return dio;
  }

  BaseOptions _createBaseOptions() => BaseOptions(
        // Request base url
        baseUrl: baseUrl,

        // Timeout in milliseconds for receiving data
        receiveTimeout: const Duration(milliseconds: 15000),

        // Timeout in milliseconds for sending data
        sendTimeout: const Duration(milliseconds: 15000),

        // Timeout in milliseconds for opening url
        connectTimeout: const Duration(milliseconds: 15000),

        // // Common query parameters for each request
        // queryParameters: <String, dynamic>{'parameter1': 'value1'},

        // Common headers for each request
        headers: <String, dynamic>{'accept-encoding': 'br'},
      );
}

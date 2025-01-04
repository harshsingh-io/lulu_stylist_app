import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/chat/chat_api.dart';
import 'package:lulu_stylist_app/logic/api/chat/models/chat_session.dart';
import 'chat_failure.dart';

class ChatRepository {
  ChatRepository({
    required String baseUrl,
    Dio? dioClient,
    ChatApi? chatApi,
  })  : dio = dioClient ?? Dio(BaseOptions(baseUrl: baseUrl)),
        _chatApi =
            chatApi ?? ChatApi(dioClient ?? Dio(BaseOptions(baseUrl: baseUrl)));

  final Dio dio;
  final ChatApi _chatApi;
  final Logger log = Logger(printer: PrettyPrinter());
  final String _logTag = 'ChatRepository';

  String _getAuthHeader(String token) => 'Bearer $token';

  Future<Either<ChatFailure, Unit>> createChatSession(
    String accessToken,
    Map<String, dynamic> options,
  ) async {
    try {
      log.d('$_logTag Creating chat session', error: {
        'token': 'Bearer $accessToken',
        'options': options,
      });

      if (accessToken.isEmpty) {
        return left(const ChatFailure.unauthorized());
      }

      await _chatApi.createChatSession(
        _getAuthHeader(accessToken),
        options,
      );
      return right(unit);
    } on DioException catch (e) {
      log.e('$_logTag Chat session creation failed', error: {
        'type': e.type,
        'error': e.error,
        'message': e.message,
        'response': e.response?.data,
      });

      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ChatFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const ChatFailure.unauthorized());
      }
      if (e.response?.statusCode == 422) {
        return left(const ChatFailure.validationError());
      }
      return left(ChatFailure.serverError(e.message));
    } catch (e) {
      log.e('$_logTag Unexpected error during session creation', error: e);
      return left(ChatFailure.serverError(e.toString()));
    }
  }

  Future<Either<ChatFailure, List<ChatSession>>> getChatSessions(
    String accessToken,
  ) async {
    try {
      log.d('$_logTag Getting chat sessions', error: {
        'token': 'Bearer $accessToken',
      });

      if (accessToken.isEmpty) {
        return left(const ChatFailure.unauthorized());
      }

      final response = await _chatApi.getChatSessions(
        _getAuthHeader(accessToken),
      );

      // Validate response
      if (response == null) {
        return left(
            const ChatFailure.serverError('Invalid response from server'));
      }

      // Convert response to List<ChatSession>
      try {
        final List<ChatSession> sessions = response;
        return right(sessions);
      } catch (e) {
        log.e('$_logTag Error parsing chat sessions', error: e);
        return left(ChatFailure.serverError(
            'Error parsing chat sessions: ${e.toString()}'));
      }
    } on DioException catch (e) {
      log.e('$_logTag Get sessions failed', error: {
        'type': e.type,
        'error': e.error,
        'message': e.message,
        'response': e.response?.data,
      });

      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ChatFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const ChatFailure.unauthorized());
      }
      return left(ChatFailure.serverError(e.message));
    } catch (e) {
      log.e('$_logTag Unexpected error getting sessions', error: e);
      return left(ChatFailure.serverError(e.toString()));
    }
  }

  Future<Either<ChatFailure, Unit>> sendMessage(
    String accessToken,
    String sessionId,
    String message,
  ) async {
    try {
      log.d('$_logTag Sending message', error: {
        'token': 'Bearer $accessToken',
        'sessionId': sessionId,
        'message': message,
      });

      if (accessToken.isEmpty) {
        return left(const ChatFailure.unauthorized());
      }

      await _chatApi.sendMessage(
        _getAuthHeader(accessToken),
        sessionId,
        message,
      );
      return right(unit);
    } on DioException catch (e) {
      log.e('$_logTag Send message failed', error: {
        'type': e.type,
        'error': e.error,
        'message': e.message,
        'response': e.response?.data,
      });

      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ChatFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const ChatFailure.unauthorized());
      }
      return left(ChatFailure.serverError(e.message));
    } catch (e) {
      log.e('$_logTag Unexpected error sending message', error: e);
      return left(ChatFailure.serverError(e.toString()));
    }
  }

  Future<Either<ChatFailure, ChatSession>> getChatHistory(
    String accessToken,
    String sessionId,
  ) async {
    try {
      log.d('$_logTag Getting chat history', error: {
        'token': 'Bearer $accessToken',
        'sessionId': sessionId,
      });

      if (accessToken.isEmpty) {
        return left(const ChatFailure.unauthorized());
      }

      final history = await _chatApi.getChatHistory(
        _getAuthHeader(accessToken),
        sessionId,
      );
      return right(history);
    } on DioException catch (e) {
      log.e('$_logTag Get history failed', error: {
        'type': e.type,
        'error': e.error,
        'message': e.message,
        'response': e.response?.data,
      });

      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ChatFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const ChatFailure.unauthorized());
      }
      return left(ChatFailure.serverError(e.message));
    } catch (e) {
      log.e('$_logTag Unexpected error getting history', error: e);
      return left(ChatFailure.serverError(e.toString()));
    }
  }

  Future<Either<ChatFailure, Unit>> deleteChatSession(
    String accessToken,
    String sessionId,
  ) async {
    try {
      log.d('$_logTag Deleting chat session', error: {
        'token': 'Bearer $accessToken',
        'sessionId': sessionId,
      });

      if (accessToken.isEmpty) {
        return left(const ChatFailure.unauthorized());
      }

      await _chatApi.deleteChatSession(
        _getAuthHeader(accessToken),
        sessionId,
      );
      return right(unit);
    } on DioException catch (e) {
      log.e('$_logTag Delete session failed', error: {
        'type': e.type,
        'error': e.error,
        'message': e.message,
        'response': e.response?.data,
      });

      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ChatFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const ChatFailure.unauthorized());
      }
      return left(ChatFailure.serverError(e.message));
    } catch (e) {
      log.e('$_logTag Unexpected error deleting session', error: e);
      return left(ChatFailure.serverError(e.toString()));
    }
  }

  Future<Either<ChatFailure, Unit>> deleteAllChatSessions(
    String accessToken,
  ) async {
    try {
      log.d('$_logTag Deleting all chat sessions', error: {
        'token': 'Bearer $accessToken',
      });

      if (accessToken.isEmpty) {
        return left(const ChatFailure.unauthorized());
      }

      await _chatApi.deleteAllChatSessions(
        _getAuthHeader(accessToken),
      );
      return right(unit);
    } on DioException catch (e) {
      log.e('$_logTag Delete all sessions failed', error: {
        'type': e.type,
        'error': e.error,
        'message': e.message,
        'response': e.response?.data,
      });

      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ChatFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const ChatFailure.unauthorized());
      }
      return left(ChatFailure.serverError(e.message));
    } catch (e) {
      log.e('$_logTag Unexpected error deleting all sessions', error: e);
      return left(ChatFailure.serverError(e.toString()));
    }
  }
}

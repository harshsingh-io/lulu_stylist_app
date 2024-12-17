// chat_repository.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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

  Future<Either<ChatFailure, Unit>> createChatSession(
      Map<String, dynamic> options) async {
    try {
      await _chatApi.createChatSession(options);
      return right(unit);
    } on DioException catch (e) {
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
      return left(ChatFailure.serverError(e.toString()));
    }
  }

  Future<Either<ChatFailure, List<ChatSession>>> getChatSessions() async {
    try {
      final sessions = await _chatApi.getChatSessions();
      return right(sessions);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ChatFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const ChatFailure.unauthorized());
      }
      return left(ChatFailure.serverError(e.message));
    } catch (e) {
      return left(ChatFailure.serverError(e.toString()));
    }
  }

  Future<Either<ChatFailure, Unit>> sendMessage(
      String sessionId, String message) async {
    try {
      await _chatApi.sendMessage(sessionId, message);
      return right(unit);
    } on DioException catch (e) {
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
      return left(ChatFailure.serverError(e.toString()));
    }
  }

  Future<Either<ChatFailure, ChatSession>> getChatHistory(
      String sessionId) async {
    try {
      final history = await _chatApi.getChatHistory(sessionId);
      return right(history);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ChatFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const ChatFailure.unauthorized());
      }
      if (e.response?.statusCode == 404) {
        return left(const ChatFailure.sessionNotFound());
      }
      return left(ChatFailure.serverError(e.message));
    } catch (e) {
      return left(ChatFailure.serverError(e.toString()));
    }
  }

  Future<Either<ChatFailure, Unit>> deleteChatSession(String sessionId) async {
    try {
      await _chatApi.deleteChatSession(sessionId);
      return right(unit);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(const ChatFailure.networkError());
      }
      if (e.response?.statusCode == 401) {
        return left(const ChatFailure.unauthorized());
      }
      if (e.response?.statusCode == 404) {
        return left(const ChatFailure.sessionNotFound());
      }
      return left(ChatFailure.serverError(e.message));
    } catch (e) {
      return left(ChatFailure.serverError(e.toString()));
    }
  }
}

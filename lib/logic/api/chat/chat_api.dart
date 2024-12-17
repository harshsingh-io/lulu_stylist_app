// chat_api.dart
import 'package:dio/dio.dart';
import 'package:lulu_stylist_app/logic/api/chat/models/chat_session.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_api.g.dart';

@RestApi()
abstract class ChatApi {
  factory ChatApi(Dio dio) = _ChatApi;

  @POST('/api/chat/chat/sessions')
  Future<void> createChatSession(@Body() Map<String, dynamic> options);

  @GET('/api/chat/chat/sessions')
  Future<List<ChatSession>> getChatSessions();

  @POST('/api/chat/chat/{sessionId}/message')
  Future<void> sendMessage(
    @Path('sessionId') String sessionId,
    @Query('message') String message,
  );

  @GET('/api/chat/chat/{sessionId}')
  Future<ChatSession> getChatHistory(
    @Path('sessionId') String sessionId,
  );

  @DELETE('/api/chat/chat/{sessionId}')
  Future<String> deleteChatSession(
    @Path('sessionId') String sessionId,
  );
}

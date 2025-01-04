import 'package:dio/dio.dart';
import 'package:lulu_stylist_app/logic/api/chat/models/chat_session.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_api.g.dart';

@RestApi()
abstract class ChatApi {
  factory ChatApi(Dio dio) = _ChatApi;

  @POST('/api/chat/chat/sessions')
  Future<void> createChatSession(
    @Header('Authorization') String token,
    @Body() Map<String, dynamic> options,
  );

  @GET('/api/chat/chat/sessions')
  Future<List<ChatSession>> getChatSessions(
    @Header('Authorization') String token,
  );

  @POST('/api/chat/chat/{sessionId}/message')
  Future<void> sendMessage(
    @Header('Authorization') String token,
    @Path('sessionId') String sessionId,
    @Query('message') String message,
  );

  @GET('/api/chat/chat/{sessionId}')
  Future<ChatSession> getChatHistory(
    @Header('Authorization') String token,
    @Path('sessionId') String sessionId,
  );

  @DELETE('/api/chat/chat/{sessionId}')
  Future<void> deleteChatSession(
    @Header('Authorization') String token,
    @Path('sessionId') String sessionId,
  );

  @DELETE('/api/chat/chat/sessions/all')
  Future<void> deleteAllChatSessions(
    @Header('Authorization') String token,
  );
}

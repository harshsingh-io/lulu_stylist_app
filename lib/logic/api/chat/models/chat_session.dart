import 'package:freezed_annotation/freezed_annotation.dart';
import 'chat_message.dart';

part 'chat_session.freezed.dart';
part 'chat_session.g.dart';

@freezed
class ChatSession with _$ChatSession {
  const factory ChatSession({
    @JsonKey(name: 'id') required String sessionId,
    @JsonKey(name: 'user_id') required String userId,
    @Default([]) List<ChatMessage> messages,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'session_name') required String? sessionName,
    @JsonKey(name: 'user_context')
    @Default({})
    Map<String, dynamic> userContext,
  }) = _ChatSession;

  factory ChatSession.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionFromJson(json);
}

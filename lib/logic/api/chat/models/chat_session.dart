// chat_session.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'chat_message.dart';

part 'chat_session.freezed.dart';
part 'chat_session.g.dart';

@freezed
class ChatSession with _$ChatSession {
  const factory ChatSession({
    required String userId,
    required List<ChatMessage> messages,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String sessionName,
    required Map<String, dynamic> userContext,
  }) = _ChatSession;

  factory ChatSession.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionFromJson(json);
}

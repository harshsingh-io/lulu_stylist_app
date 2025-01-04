part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.started() = _Started;
  const factory ChatEvent.createSession(Map<String, dynamic> options) =
      _CreateSession;
  const factory ChatEvent.loadSessions() = _LoadSessions;
  const factory ChatEvent.sendMessage(String sessionId, String message) =
      _SendMessage;
  const factory ChatEvent.loadHistory(String sessionId) = _LoadHistory;
  const factory ChatEvent.deleteSession(String sessionId) = _DeleteSession;
  const factory ChatEvent.deleteAllSessions() = _DeleteAllSessions;
}

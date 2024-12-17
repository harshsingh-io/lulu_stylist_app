// chat_state.dart
part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.loading() = _Loading;
  const factory ChatState.sessionsLoaded(List<ChatSession> sessions) =
      _SessionsLoaded;
  const factory ChatState.historyLoaded(ChatSession session) = _HistoryLoaded;
  const factory ChatState.error(ChatFailure failure) = _Error;
}
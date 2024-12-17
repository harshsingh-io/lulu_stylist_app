// chat_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/chat/models/chat_session.dart';
import 'package:lulu_stylist_app/logic/bloc/chat/chat_failure.dart';
import 'package:lulu_stylist_app/logic/bloc/chat/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

Logger log = Logger(printer: PrettyPrinter());

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({required ChatRepository repository})
      : _repository = repository,
        super(const ChatState.initial()) {
    on<_Started>(_onStarted);
    on<_CreateSession>(_onCreateSession);
    on<_LoadSessions>(_onLoadSessions);
    on<_SendMessage>(_onSendMessage);
    on<_LoadHistory>(_onLoadHistory);
    on<_DeleteSession>(_onDeleteSession);
  }

  final String _logTag = 'ChatBloc';
  final ChatRepository _repository;

  Future<void> _onStarted(_Started event, Emitter<ChatState> emit) async {
    await _onLoadSessions(const _LoadSessions(), emit);
  }

  Future<void> _onCreateSession(
      _CreateSession event, Emitter<ChatState> emit) async {
    try {
      emit(const ChatState.loading());
      final result = await _repository.createChatSession(event.options);
      result.fold(
        (failure) => emit(ChatState.error(failure)),
        (_) async {
          final sessionsResult = await _repository.getChatSessions();
          emit(sessionsResult.fold(
            (failure) => ChatState.error(failure),
            (sessions) => ChatState.sessionsLoaded(sessions),
          ));
        },
      );
    } catch (e, stackTrace) {
      log.e('$_logTag Unexpected error in _onCreateSession',
          error: e, stackTrace: stackTrace);
      emit(ChatState.error(ChatFailure.serverError(e.toString())));
    }
  }

  Future<void> _onLoadSessions(
      _LoadSessions event, Emitter<ChatState> emit) async {
    try {
      emit(const ChatState.loading());
      final result = await _repository.getChatSessions();
      emit(result.fold(
        (failure) => ChatState.error(failure),
        (sessions) => ChatState.sessionsLoaded(sessions),
      ));
    } catch (e, stackTrace) {
      log.e('$_logTag Unexpected error in _onLoadSessions',
          error: e, stackTrace: stackTrace);
      emit(ChatState.error(ChatFailure.serverError(e.toString())));
    }
  }

  Future<void> _onSendMessage(
      _SendMessage event, Emitter<ChatState> emit) async {
    try {
      emit(const ChatState.loading());
      final result =
          await _repository.sendMessage(event.sessionId, event.message);
      result.fold(
        (failure) => emit(ChatState.error(failure)),
        (_) async {
          final historyResult =
              await _repository.getChatHistory(event.sessionId);
          emit(historyResult.fold(
            (failure) => ChatState.error(failure),
            (session) => ChatState.historyLoaded(session),
          ));
        },
      );
    } catch (e, stackTrace) {
      log.e('$_logTag Unexpected error in _onSendMessage',
          error: e, stackTrace: stackTrace);
      emit(ChatState.error(ChatFailure.serverError(e.toString())));
    }
  }

  Future<void> _onLoadHistory(
      _LoadHistory event, Emitter<ChatState> emit) async {
    try {
      emit(const ChatState.loading());
      final result = await _repository.getChatHistory(event.sessionId);
      emit(result.fold(
        (failure) => ChatState.error(failure),
        (session) => ChatState.historyLoaded(session),
      ));
    } catch (e, stackTrace) {
      log.e('$_logTag Unexpected error in _onLoadHistory',
          error: e, stackTrace: stackTrace);
      emit(ChatState.error(ChatFailure.serverError(e.toString())));
    }
  }

  Future<void> _onDeleteSession(
      _DeleteSession event, Emitter<ChatState> emit) async {
    try {
      emit(const ChatState.loading());
      final result = await _repository.deleteChatSession(event.sessionId);
      result.fold(
        (failure) => emit(ChatState.error(failure)),
        (_) async {
          final sessionsResult = await _repository.getChatSessions();
          emit(sessionsResult.fold(
            (failure) => ChatState.error(failure),
            (sessions) => ChatState.sessionsLoaded(sessions),
          ));
        },
      );
    } catch (e, stackTrace) {
      log.e('$_logTag Unexpected error in _onDeleteSession',
          error: e, stackTrace: stackTrace);
      emit(ChatState.error(ChatFailure.serverError(e.toString())));
    }
  }
}

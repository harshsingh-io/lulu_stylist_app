import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/chat/models/chat_message.dart';
import 'package:lulu_stylist_app/logic/api/chat/models/chat_session.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/chat/chat_failure.dart';
import 'package:lulu_stylist_app/logic/bloc/chat/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;
  final AuthenticationBloc _authBloc;
  final Logger log = Logger(printer: PrettyPrinter());
  String? _currentSessionId;

  ChatBloc({
    required ChatRepository chatRepository,
    required AuthenticationBloc authBloc,
  })  : _chatRepository = chatRepository,
        _authBloc = authBloc,
        super(const ChatState.initial()) {
    on<_Started>(_onStarted);
    on<_CreateSession>(_onCreateSession);
    on<_LoadSessions>(_onLoadSessions);
    on<_SendMessage>(_onSendMessage);
    on<_LoadHistory>(_onLoadHistory);
    on<_DeleteSession>(_onDeleteSession);
    on<_DeleteAllSessions>(_onDeleteAllSessions);
  }

  String? get currentSessionId => _currentSessionId;

  void _updateCurrentSession(String sessionId) {
    _currentSessionId = sessionId;
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<ChatState> emit,
  ) async {
    emit(const ChatState
        .initial()); // This ensures we go back to context selection
  }

// In chat_bloc.dart
  Future<void> _onCreateSession(
    _CreateSession event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(const ChatState.loading());

      final authState = _authBloc.state;
      final accessToken = authState.maybeWhen(
        userLoggedIn: (user, token) => token,
        orElse: () => null,
      );

      if (accessToken == null) {
        emit(const ChatState.error(ChatFailure.unauthorized()));
        return;
      }

      final result = await _chatRepository.createChatSession(
        accessToken,
        event.options,
      );

      result.fold(
        (failure) => emit(ChatState.error(failure)),
        (_) async {
          // After creating session, load the sessions to get the new session ID
          final sessionsResult =
              await _chatRepository.getChatSessions(accessToken);
          sessionsResult.fold(
            (failure) => emit(ChatState.error(failure)),
            (sessions) {
              if (sessions.isNotEmpty) {
                // Sort sessions by creation date (newest first)
                final sortedSessions = List<ChatSession>.from(sessions)
                  ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

                // Get the most recent session
                final newSession = sortedSessions.first;
                _currentSessionId = newSession.sessionId;
                // Load the new session's history
                add(ChatEvent.loadHistory(newSession.sessionId));
              }
            },
          );
        },
      );
    } catch (e) {
      emit(ChatState.error(ChatFailure.serverError(e.toString())));
    }
  }

// In ChatBloc class
  Future<void> _onLoadSessions(
    _LoadSessions event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(const ChatState.loading());

      final authState = _authBloc.state;
      final accessToken = authState.maybeWhen(
        userLoggedIn: (user, token) => token,
        orElse: () => null,
      );

      if (accessToken == null) {
        emit(const ChatState.error(ChatFailure.unauthorized()));
        return;
      }

      final result = await _chatRepository.getChatSessions(accessToken);

      result.fold(
        (failure) => emit(ChatState.error(failure)),
        (sessions) {
          if (sessions.isEmpty) {
            emit(const ChatState.sessionsLoaded([]));
          } else {
            // Sort sessions by creation date (newest first)
            final sortedSessions = List<ChatSession>.from(sessions)
              ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
            emit(ChatState.sessionsLoaded(sortedSessions));
          }
        },
      );
    } catch (e) {
      emit(ChatState.error(ChatFailure.serverError(e.toString())));
    }
  }

  Future<void> _onSendMessage(
    _SendMessage event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final currentState = state;
      if (!currentState.maybeWhen(
        historyLoaded: (session, isMessageSending) => true,
        orElse: () => false,
      )) {
        return;
      }

      final authState = _authBloc.state;
      final accessToken = authState.maybeWhen(
        userLoggedIn: (user, token) => token,
        orElse: () => null,
      );

      if (accessToken == null) {
        emit(const ChatState.error(ChatFailure.unauthorized()));
        return;
      }

      // Add user message immediately to the UI
      currentState.maybeWhen(
        historyLoaded: (session, _) {
          final updatedMessages = List<ChatMessage>.from(session.messages)
            ..add(
              ChatMessage(
                role: 'user',
                content: event.message,
                timestamp: DateTime.now(),
              ),
            )
            ..add(
              ChatMessage(
                role: 'assistant',
                content: '', // Empty content for loading state
                timestamp: DateTime.now(),
              ),
            );

          final updatedSession = session.copyWith(messages: updatedMessages);
          emit(ChatState.historyLoaded(updatedSession, true));
        },
        orElse: () {},
      );

      final result = await _chatRepository.sendMessage(
        accessToken,
        event.sessionId,
        event.message,
      );

      result.fold(
        (failure) => emit(ChatState.error(failure)),
        (_) => add(ChatEvent.loadHistory(event.sessionId)),
      );
    } catch (e) {
      emit(ChatState.error(ChatFailure.serverError(e.toString())));
    }
  }

  Future<void> _onLoadHistory(
    _LoadHistory event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final authState = _authBloc.state;
      final accessToken = authState.maybeWhen(
        userLoggedIn: (user, token) => token,
        orElse: () => null,
      );

      if (accessToken == null) {
        emit(const ChatState.error(ChatFailure.unauthorized()));
        return;
      }

      final result = await _chatRepository.getChatHistory(
        accessToken,
        event.sessionId,
      );

      result.fold(
        (failure) => emit(ChatState.error(failure)),
        (session) {
          _currentSessionId = session.sessionId;
          emit(ChatState.historyLoaded(session, false));
        },
      );
    } catch (e) {
      emit(ChatState.error(ChatFailure.serverError(e.toString())));
    }
  }

  Future<void> _onDeleteSession(
    _DeleteSession event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final authState = _authBloc.state;
      final accessToken = authState.maybeWhen(
        userLoggedIn: (user, token) => token,
        orElse: () => null,
      );

      if (accessToken == null) {
        emit(const ChatState.error(ChatFailure.unauthorized()));
        return;
      }

      final result = await _chatRepository.deleteChatSession(
        accessToken,
        event.sessionId,
      );

      result.fold(
        (failure) => emit(ChatState.error(failure)),
        (_) {
          if (_currentSessionId == event.sessionId) {
            _currentSessionId = null;
          }
          add(const ChatEvent.loadSessions());
        },
      );
    } catch (e) {
      emit(ChatState.error(ChatFailure.serverError(e.toString())));
    }
  }

  Future<void> _onDeleteAllSessions(
    _DeleteAllSessions event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final authState = _authBloc.state;
      final accessToken = authState.maybeWhen(
        userLoggedIn: (user, token) => token,
        orElse: () => null,
      );

      if (accessToken == null) {
        emit(const ChatState.error(ChatFailure.unauthorized()));
        return;
      }

      final result = await _chatRepository.deleteAllChatSessions(accessToken);

      result.fold(
        (failure) => emit(ChatState.error(failure)),
        (_) {
          _currentSessionId = null;
          emit(const ChatState.sessionsLoaded([]));
        },
      );
    } catch (e) {
      emit(ChatState.error(ChatFailure.serverError(e.toString())));
    }
  }
}

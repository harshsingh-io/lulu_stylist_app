// chat_failure.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_failure.freezed.dart';

@freezed
class ChatFailure with _$ChatFailure {
  const factory ChatFailure.serverError([String? message]) = _ServerError;
  const factory ChatFailure.networkError() = _NetworkError;
  const factory ChatFailure.unauthorized() = _Unauthorized;
  const factory ChatFailure.sessionNotFound() = _SessionNotFound;
  const factory ChatFailure.validationError() = _ValidationError;
}

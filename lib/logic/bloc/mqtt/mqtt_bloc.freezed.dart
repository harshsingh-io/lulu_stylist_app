// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mqtt_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MqttEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pause,
    required TResult Function() clientConnected,
    required TResult Function() clientDisconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pause,
    TResult? Function()? clientConnected,
    TResult? Function()? clientDisconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pause,
    TResult Function()? clientConnected,
    TResult Function()? clientDisconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pause value) pause,
    required TResult Function(_ClientConnected value) clientConnected,
    required TResult Function(_ClientDisconnected value) clientDisconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pause value)? pause,
    TResult? Function(_ClientConnected value)? clientConnected,
    TResult? Function(_ClientDisconnected value)? clientDisconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pause value)? pause,
    TResult Function(_ClientConnected value)? clientConnected,
    TResult Function(_ClientDisconnected value)? clientDisconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MqttEventCopyWith<$Res> {
  factory $MqttEventCopyWith(MqttEvent value, $Res Function(MqttEvent) then) =
      _$MqttEventCopyWithImpl<$Res, MqttEvent>;
}

/// @nodoc
class _$MqttEventCopyWithImpl<$Res, $Val extends MqttEvent>
    implements $MqttEventCopyWith<$Res> {
  _$MqttEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MqttEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PauseImplCopyWith<$Res> {
  factory _$$PauseImplCopyWith(
          _$PauseImpl value, $Res Function(_$PauseImpl) then) =
      __$$PauseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PauseImplCopyWithImpl<$Res>
    extends _$MqttEventCopyWithImpl<$Res, _$PauseImpl>
    implements _$$PauseImplCopyWith<$Res> {
  __$$PauseImplCopyWithImpl(
      _$PauseImpl _value, $Res Function(_$PauseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MqttEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PauseImpl implements _Pause {
  const _$PauseImpl();

  @override
  String toString() {
    return 'MqttEvent.pause()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PauseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pause,
    required TResult Function() clientConnected,
    required TResult Function() clientDisconnected,
  }) {
    return pause();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pause,
    TResult? Function()? clientConnected,
    TResult? Function()? clientDisconnected,
  }) {
    return pause?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pause,
    TResult Function()? clientConnected,
    TResult Function()? clientDisconnected,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pause value) pause,
    required TResult Function(_ClientConnected value) clientConnected,
    required TResult Function(_ClientDisconnected value) clientDisconnected,
  }) {
    return pause(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pause value)? pause,
    TResult? Function(_ClientConnected value)? clientConnected,
    TResult? Function(_ClientDisconnected value)? clientDisconnected,
  }) {
    return pause?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pause value)? pause,
    TResult Function(_ClientConnected value)? clientConnected,
    TResult Function(_ClientDisconnected value)? clientDisconnected,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause(this);
    }
    return orElse();
  }
}

abstract class _Pause implements MqttEvent {
  const factory _Pause() = _$PauseImpl;
}

/// @nodoc
abstract class _$$ClientConnectedImplCopyWith<$Res> {
  factory _$$ClientConnectedImplCopyWith(_$ClientConnectedImpl value,
          $Res Function(_$ClientConnectedImpl) then) =
      __$$ClientConnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClientConnectedImplCopyWithImpl<$Res>
    extends _$MqttEventCopyWithImpl<$Res, _$ClientConnectedImpl>
    implements _$$ClientConnectedImplCopyWith<$Res> {
  __$$ClientConnectedImplCopyWithImpl(
      _$ClientConnectedImpl _value, $Res Function(_$ClientConnectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MqttEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClientConnectedImpl implements _ClientConnected {
  const _$ClientConnectedImpl();

  @override
  String toString() {
    return 'MqttEvent.clientConnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClientConnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pause,
    required TResult Function() clientConnected,
    required TResult Function() clientDisconnected,
  }) {
    return clientConnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pause,
    TResult? Function()? clientConnected,
    TResult? Function()? clientDisconnected,
  }) {
    return clientConnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pause,
    TResult Function()? clientConnected,
    TResult Function()? clientDisconnected,
    required TResult orElse(),
  }) {
    if (clientConnected != null) {
      return clientConnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pause value) pause,
    required TResult Function(_ClientConnected value) clientConnected,
    required TResult Function(_ClientDisconnected value) clientDisconnected,
  }) {
    return clientConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pause value)? pause,
    TResult? Function(_ClientConnected value)? clientConnected,
    TResult? Function(_ClientDisconnected value)? clientDisconnected,
  }) {
    return clientConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pause value)? pause,
    TResult Function(_ClientConnected value)? clientConnected,
    TResult Function(_ClientDisconnected value)? clientDisconnected,
    required TResult orElse(),
  }) {
    if (clientConnected != null) {
      return clientConnected(this);
    }
    return orElse();
  }
}

abstract class _ClientConnected implements MqttEvent {
  const factory _ClientConnected() = _$ClientConnectedImpl;
}

/// @nodoc
abstract class _$$ClientDisconnectedImplCopyWith<$Res> {
  factory _$$ClientDisconnectedImplCopyWith(_$ClientDisconnectedImpl value,
          $Res Function(_$ClientDisconnectedImpl) then) =
      __$$ClientDisconnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClientDisconnectedImplCopyWithImpl<$Res>
    extends _$MqttEventCopyWithImpl<$Res, _$ClientDisconnectedImpl>
    implements _$$ClientDisconnectedImplCopyWith<$Res> {
  __$$ClientDisconnectedImplCopyWithImpl(_$ClientDisconnectedImpl _value,
      $Res Function(_$ClientDisconnectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MqttEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClientDisconnectedImpl implements _ClientDisconnected {
  const _$ClientDisconnectedImpl();

  @override
  String toString() {
    return 'MqttEvent.clientDisconnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClientDisconnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pause,
    required TResult Function() clientConnected,
    required TResult Function() clientDisconnected,
  }) {
    return clientDisconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pause,
    TResult? Function()? clientConnected,
    TResult? Function()? clientDisconnected,
  }) {
    return clientDisconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pause,
    TResult Function()? clientConnected,
    TResult Function()? clientDisconnected,
    required TResult orElse(),
  }) {
    if (clientDisconnected != null) {
      return clientDisconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pause value) pause,
    required TResult Function(_ClientConnected value) clientConnected,
    required TResult Function(_ClientDisconnected value) clientDisconnected,
  }) {
    return clientDisconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pause value)? pause,
    TResult? Function(_ClientConnected value)? clientConnected,
    TResult? Function(_ClientDisconnected value)? clientDisconnected,
  }) {
    return clientDisconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pause value)? pause,
    TResult Function(_ClientConnected value)? clientConnected,
    TResult Function(_ClientDisconnected value)? clientDisconnected,
    required TResult orElse(),
  }) {
    if (clientDisconnected != null) {
      return clientDisconnected(this);
    }
    return orElse();
  }
}

abstract class _ClientDisconnected implements MqttEvent {
  const factory _ClientDisconnected() = _$ClientDisconnectedImpl;
}

/// @nodoc
mixin _$MqttState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function() disconnected,
    required TResult Function() reconnecting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function()? disconnected,
    TResult? Function()? reconnecting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function()? disconnected,
    TResult Function()? reconnecting,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Reconnecting value) reconnecting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Reconnecting value)? reconnecting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Reconnecting value)? reconnecting,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MqttStateCopyWith<$Res> {
  factory $MqttStateCopyWith(MqttState value, $Res Function(MqttState) then) =
      _$MqttStateCopyWithImpl<$Res, MqttState>;
}

/// @nodoc
class _$MqttStateCopyWithImpl<$Res, $Val extends MqttState>
    implements $MqttStateCopyWith<$Res> {
  _$MqttStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MqttState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConnectingImplCopyWith<$Res> {
  factory _$$ConnectingImplCopyWith(
          _$ConnectingImpl value, $Res Function(_$ConnectingImpl) then) =
      __$$ConnectingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectingImplCopyWithImpl<$Res>
    extends _$MqttStateCopyWithImpl<$Res, _$ConnectingImpl>
    implements _$$ConnectingImplCopyWith<$Res> {
  __$$ConnectingImplCopyWithImpl(
      _$ConnectingImpl _value, $Res Function(_$ConnectingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MqttState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectingImpl implements _Connecting {
  const _$ConnectingImpl();

  @override
  String toString() {
    return 'MqttState.connecting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function() disconnected,
    required TResult Function() reconnecting,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function()? disconnected,
    TResult? Function()? reconnecting,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function()? disconnected,
    TResult Function()? reconnecting,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Reconnecting value) reconnecting,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Reconnecting value)? reconnecting,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Reconnecting value)? reconnecting,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class _Connecting implements MqttState {
  const factory _Connecting() = _$ConnectingImpl;
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
          _$ConnectedImpl value, $Res Function(_$ConnectedImpl) then) =
      __$$ConnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$MqttStateCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
      _$ConnectedImpl _value, $Res Function(_$ConnectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MqttState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectedImpl implements _Connected {
  const _$ConnectedImpl();

  @override
  String toString() {
    return 'MqttState.connected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function() disconnected,
    required TResult Function() reconnecting,
  }) {
    return connected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function()? disconnected,
    TResult? Function()? reconnecting,
  }) {
    return connected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function()? disconnected,
    TResult Function()? reconnecting,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Reconnecting value) reconnecting,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Reconnecting value)? reconnecting,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Reconnecting value)? reconnecting,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _Connected implements MqttState {
  const factory _Connected() = _$ConnectedImpl;
}

/// @nodoc
abstract class _$$DisconnectedImplCopyWith<$Res> {
  factory _$$DisconnectedImplCopyWith(
          _$DisconnectedImpl value, $Res Function(_$DisconnectedImpl) then) =
      __$$DisconnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisconnectedImplCopyWithImpl<$Res>
    extends _$MqttStateCopyWithImpl<$Res, _$DisconnectedImpl>
    implements _$$DisconnectedImplCopyWith<$Res> {
  __$$DisconnectedImplCopyWithImpl(
      _$DisconnectedImpl _value, $Res Function(_$DisconnectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MqttState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisconnectedImpl implements _Disconnected {
  const _$DisconnectedImpl();

  @override
  String toString() {
    return 'MqttState.disconnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisconnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function() disconnected,
    required TResult Function() reconnecting,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function()? disconnected,
    TResult? Function()? reconnecting,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function()? disconnected,
    TResult Function()? reconnecting,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Reconnecting value) reconnecting,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Reconnecting value)? reconnecting,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Reconnecting value)? reconnecting,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class _Disconnected implements MqttState {
  const factory _Disconnected() = _$DisconnectedImpl;
}

/// @nodoc
abstract class _$$ReconnectingImplCopyWith<$Res> {
  factory _$$ReconnectingImplCopyWith(
          _$ReconnectingImpl value, $Res Function(_$ReconnectingImpl) then) =
      __$$ReconnectingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReconnectingImplCopyWithImpl<$Res>
    extends _$MqttStateCopyWithImpl<$Res, _$ReconnectingImpl>
    implements _$$ReconnectingImplCopyWith<$Res> {
  __$$ReconnectingImplCopyWithImpl(
      _$ReconnectingImpl _value, $Res Function(_$ReconnectingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MqttState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReconnectingImpl implements _Reconnecting {
  const _$ReconnectingImpl();

  @override
  String toString() {
    return 'MqttState.reconnecting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReconnectingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connected,
    required TResult Function() disconnected,
    required TResult Function() reconnecting,
  }) {
    return reconnecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connected,
    TResult? Function()? disconnected,
    TResult? Function()? reconnecting,
  }) {
    return reconnecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connected,
    TResult Function()? disconnected,
    TResult Function()? reconnecting,
    required TResult orElse(),
  }) {
    if (reconnecting != null) {
      return reconnecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Reconnecting value) reconnecting,
  }) {
    return reconnecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Reconnecting value)? reconnecting,
  }) {
    return reconnecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Reconnecting value)? reconnecting,
    required TResult orElse(),
  }) {
    if (reconnecting != null) {
      return reconnecting(this);
    }
    return orElse();
  }
}

abstract class _Reconnecting implements MqttState {
  const factory _Reconnecting() = _$ReconnectingImpl;
}

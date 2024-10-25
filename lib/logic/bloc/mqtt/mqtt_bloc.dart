import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/bloc/mqtt/src/mqtt_client.dart';
import 'package:lulu_stylist_app/logic/bloc/mqtt/src/mqtt_handler.dart';
import 'package:lulu_stylist_app/lulu_design_system/toast/sa_toast.dart';
import 'package:nanoid/nanoid.dart';

part 'mqtt_bloc.freezed.dart';
part 'mqtt_event.dart';
part 'mqtt_state.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

enum Status {
  connecting,
  connected,
  listening,
  disconnecting,
  disconnected,
  paused,
}

class MqttBloc extends Bloc<MqttEvent, MqttState> implements MqttHandler {
  factory MqttBloc() {
    return _instance;
  }
  MqttBloc._internal() : super(const MqttState.connecting()) {
    log.d(
      {
        'logTag': logTag,
        'instance': hashCode,
        'message': 'MqttBloc: starting',
      },
    );

    on<_ClientConnected>(_onClientConnected);
    on<_ClientDisconnected>(_onClientDisconnected);

    _mqttClient = MqttClient(
      url: 'mqtt://broker.emqx.io:1883',
      identifier: 'mobile_app_${nanoid(10)}',
      mqttBloc: this,
    );
    _mqttClient.connect();
    // ..onConnected = onMqttConnected
    // ..onDisconnected = onMqttDisconnected

    log.d(
      {
        'logTag': logTag,
        'instance': hashCode,
        'message': 'MqttBloc: starting done',
      },
    );
  }

  static const String logTag = 'MqttBloc';
  static final MqttBloc _instance = MqttBloc._internal();
  final Map<String, List<StreamController<dynamic>>> _topics = {};

  Stream<dynamic>? subscribe(String topic) {
    final controller = StreamController<dynamic>.broadcast();
    if (!_topics.containsKey(topic)) {
      _topics[topic] = [];
      _mqttClient.subscribe(topic);
    }
    _topics[topic]?.add(controller);

    log.d(
      {
        'logTag': logTag,
        'instance': hashCode,
        'message': 'Subcribing to topic',
        'topic': topic,
      },
    );
    return controller.stream;
  }

  void unsubscribe(String topic) {
    if (_topics.containsKey(topic)) {
      _topics[topic]?.removeWhere((controller) => controller.stream == stream);
      if (_topics[topic]?.isEmpty ?? false) {
        _topics.remove(topic);
        _mqttClient.unsubscribe(topic);
      }
    }
    log.d(
      {
        'logTag': logTag,
        'instance': hashCode,
        'message': 'Unsubcribing to topic',
        'topic': topic,
      },
    );
  }

  bool _isMatch(String pattern, String topic) {
    final patternParts = pattern.split('/');
    final topicParts = topic.split('/');

    if (patternParts.length != topicParts.length) {
      return false;
    }

    for (var i = 0; i < patternParts.length; i++) {
      if (patternParts[i] != '+' &&
          patternParts[i] != '#' &&
          patternParts[i] != topicParts[i]) {
        return false;
      }

      if (patternParts[i] == '#' && i != patternParts.length - 1) {
        return true; // '#' must be the last character in the pattern
      }

      if (patternParts[i] == '#' || patternParts[i] == '+') {
        continue;
      }
    }

    return true;
  }

  late MqttClient _mqttClient;

  Future<void> _onClientConnected(
    _ClientConnected event,
    Emitter<MqttState> emit,
  ) async {
    _mqttClient.registerHandler(this);

    LuluToast.showToast(
      title: 'Oh Great!!!',
      message: 'Mqtt Connected',
      contentType: ContentType.success,
    );

    emit(const MqttState.connected());
  }

  Future<void> _onClientDisconnected(
    _ClientDisconnected event,
    Emitter<MqttState> emit,
  ) async {
    LuluToast.showToast(
      title: 'Oh No!!!',
      message: 'Mqtt Disconnected',
      contentType: ContentType.failure,
    );
    emit(const MqttState.disconnected());
  }

  void onMqttConnected() {
    log.d(
      {
        'logTag': logTag,
        'instance': hashCode,
        'message': 'Mqtt connected',
      },
    );

    add(const MqttEvent.clientConnected());
  }

  void onMqttDisconnected() {
    log.d(
      {
        'logTag': logTag,
        'instance': hashCode,
        'message': 'Mqtt disconnected',
      },
    );
    add(const MqttEvent.clientDisconnected());
  }

  void publish(String topic, Map<String, dynamic> payload) {
    log.d(
      {
        'logTag': logTag,
        'instance': hashCode,
        'message': 'Publishing to topic',
        'payload': payload,
        'topic': topic,
      },
    );

    _mqttClient.publish(topic, payload);
  }

  @override
  Future<void> close() async {
    log.d(
      {
        'logTag': logTag,
        'instance': hashCode,
        'message': 'Closing mqtt bloc',
      },
    );

    _mqttClient.disconnect();
    await super.close();
  }

  @override
  void handleMqtt(String topic, dynamic payload) {
    _topics.keys.where((t) => _isMatch(t, topic)).forEach((t) {
      _topics[t]?.forEach((controller) {
        controller.add(payload);
      });
    });
  }
}

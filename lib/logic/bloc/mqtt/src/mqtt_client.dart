import 'dart:async';
import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/bloc/mqtt/mqtt_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/mqtt/src/mqtt_exception.dart';
import 'package:lulu_stylist_app/logic/bloc/mqtt/src/mqtt_handler.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class MqttClient {
  /// So far, *url* must contains protocol and port, e.g. mqtt://localhost:1883
  MqttClient({
    required String url,
    required MqttBloc mqttBloc,
    String? identifier,
    String? prefix,
  }) {
    final uri = Uri.parse(url);
    final defaultValue = '[${prefix ?? 'mqtt_plus'}]';
    _identifier = identifier ?? defaultValue;
    _client = MqttServerClient.withPort(uri.host, _identifier, uri.port);
    _client
      ..logging(on: true)
      ..autoReconnect = true
      ..resubscribeOnAutoReconnect = true
      ..keepAlivePeriod = 60
      ..onAutoReconnect = _onAutoReconnect
      ..onConnected = _onConnected
      ..onDisconnected = _onDisconnected
      ..onSubscribed = onSubscribed
      ..onUnsubscribed = onUnsubscribed;

    _mqttBloc = mqttBloc;
  }
  static const String logTag = 'MqttClient';
  late MqttServerClient _client;
  final Set<MqttHandler> _handlers = {};
  late String _identifier;
  late MqttBloc _mqttBloc;
  // void Function()? onAutoReconnect;
  // void Function()? onConnected;
  // void Function()? onDisconnected;
  void Function(MqttSubscription?)? onSubscribed;
  void Function(MqttSubscription?)? onUnsubscribed;

  bool get connected =>
      _client.connectionStatus?.state == MqttConnectionState.connected;

  String get identifier => _identifier;

  /// Register a handler for every topic.
  void registerHandler(MqttHandler handler) {
    final exist = _handlers.contains(handler);
    if (!exist) {
      _handlers.add(handler);
    }
  }

  /// Unregister a  handler for topic.
  void unregisterHandle(String topic, MqttHandler handler) {
    final exist = _handlers.contains(handler);
    if (exist) {
      _handlers.remove(handler);
    }
  }

  void _onAutoReconnect() {
    _mqttBloc.add(const MqttEvent.clientConnected());
  }

  void _onConnected() {
    _mqttBloc.add(const MqttEvent.clientConnected());
  }

  void _onDisconnected() {
    _mqttBloc.add(const MqttEvent.clientDisconnected());
  }

  Future<void> connect([String? username, String? password]) async {
    log.d(
      {
        'logTag': logTag,
        'message': 'connecting',
      },
    );

    await _client.connect(username, password);

    _client.updates.listen(_handleReceived);

    log.d(
      {
        'logTag': logTag,
        'message': 'connected',
      },
    );
  }

  Future<void> subscribe(String topic) async {
    log.d(
      {
        'logTag': logTag,
        'message': 'Subscribe',
        'topic': topic,
      },
    );
    _client.subscribe(topic, MqttQos.atMostOnce);
  }

  void unsubscribe(String topic) {
    log.d(
      {
        'logTag': logTag,
        'message': 'Unsubscribe',
        'topic': topic,
      },
    );
    _client.unsubscribeStringTopic(topic);
  }

  void disconnect() {
    _client.disconnect();
  }

  void publish(String topic, Map<String, dynamic> payload) {
    try {
      final builder = MqttPayloadBuilder();
      payload['identifier'] = _identifier;
      final message = jsonEncode(payload);
      builder.addUTF8String(message);
      _client.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
    } catch (error) {
      throw MqttException(error.toString());
    }
  }

  void _broadcastToLocalSubscribers(String topic, dynamic jsonData) {
    for (final handler in _handlers) {
      handler.handleMqtt(topic, jsonData);
    }
  }

  void _handleReceived(List<MqttReceivedMessage<MqttMessage>>? messages) {
    try {
      messages?.forEach((message) {
        final m = message.payload as MqttPublishMessage;
        final payload = MqttUtilities.bytesToStringAsString(m.payload.message!);

        final jsonData = jsonDecode(payload);
        final topic = message.topic;

        log.d({
          'logTag': logTag,
          'message': 'Handling the received message',
          'payload': payload,
          'topic': topic,
        });

        if (topic != null) {
          _broadcastToLocalSubscribers(topic, jsonData);
        }
      });
    } catch (error) {
      throw MqttException(error.toString());
    }
  }
}

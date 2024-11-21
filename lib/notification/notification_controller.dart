import 'dart:isolate';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:firebase_core/firebase_core.dart';
//TODO: firebase Installation conflict issue
// import 'package:firebase_installations/firebase_installations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/app/view/app.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class NotificationController with ChangeNotifier {
  factory NotificationController() => _instance;
  NotificationController._internal();

  static final NotificationController _instance =
      NotificationController._internal();

  String _firebaseToken = '';
  String get firebaseToken => _firebaseToken;

  final String _nativeToken = '';
  String get nativeToken => _nativeToken;

  String _firebaseInstanceId = '';
  FcmSilentData? _lastSilentData;
  FcmSilentData? get lastSilentData => _lastSilentData;

  static Future<void> initializeLocalNotifications({
    required bool debug,
  }) async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'alerts',
          channelName: 'Alerts',
          channelDescription: 'Notification alerts',
          importance: NotificationImportance.Max,
          defaultColor: LuluBrandColor.brandPrimary,
          ledColor: LuluBrandColor.brandRed,
          groupKey: 'alerts',
          channelShowBadge: true,
        ),
      ],
      debug: debug,
    );
  }

  // Future<void> initializeInAppMessaging() async {
  //   await getInstallationId();
  // }

  // Future<void> getInstallationId() async {
  //   String id;

  //   try {
  //     id = await FirebaseInstallations.id ?? 'Unknown installation id';
  //     log.d('Firebase Installation ID : $id');
  //   } on PlatformException {
  //     id = 'Failed to get installation id.';
  //   }
  // }

  // Future<void> deleteInstallationId() async {
  //   try {
  //     await FirebaseInstallations.deleteInstallationId();
  //   } on PlatformException {}
  // }

  static Future<void> initializeRemoteNotifications({
    required bool debug,
  }) async {
    await Firebase.initializeApp();
    await AwesomeNotificationsFcm().initialize(
      onFcmSilentDataHandle: NotificationController.mySilentDataHandle,
      onFcmTokenHandle: NotificationController.myFcmTokenHandle,
      debug: debug,
    );
    await initializeIsolateReceivePort();
  }

  static Future<void> initializeNotificationListeners() async {
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.myActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.myNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.myNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.myDismissActionReceivedMethod,
    );
  }

  static Future<void> getInitialNotificationAction() async {
    final receivedAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: true);
    if (receivedAction == null) return;

    print('Notification action launched app: $receivedAction');
  }

  static ReceivePort? receivePort;
  static Future<void> initializeIsolateReceivePort() async {
    receivePort = ReceivePort('Notification action port in main isolate')
      ..listen(
        (silentData) =>
            onActionReceivedImplementationMethod(silentData as ReceivedAction),
      );

    IsolateNameServer.registerPortWithName(
      receivePort!.sendPort,
      'notification_action_port',
    );
  }

  static Future<void> myNotificationCreatedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    final message =
        'Notification created from ${receivedNotification.createdSource?.name}';
    await Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
    );
  }

  static Future<void> myNotificationDisplayedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    final message =
        'Notification displayed from ${receivedNotification.createdSource?.name}';
    await Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.blue,
    );
  }

  static Future<void> myDismissActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    final message =
        'Notification dismissed from ${receivedAction.createdSource?.name}';
    await Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.orange,
    );
  }

  static Future<void> myActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    return onActionReceivedImplementationMethod(receivedAction);
  }

  static Future<void> onActionReceivedImplementationMethod(
    ReceivedAction receivedAction,
  ) async {
    await Fluttertoast.showToast(
      msg: 'Notification action captured on ${receivedAction.actionLifeCycle}',
    );

    const targetPage = '/home';

    await App.globalNavigatorKey.currentState?.pushNamedAndRemoveUntil(
      targetPage,
      (route) => (route.settings.name != targetPage) || route.isFirst,
      arguments: receivedAction,
    );
  }

  static Future<void> mySilentDataHandle(FcmSilentData silentData) async {
    await Fluttertoast.showToast(
      msg: 'Silent data received',
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
      fontSize: 16,
    );
    log.d('Setting lastSilentData at ${DateTime.now()}');
    _instance._lastSilentData = silentData;
    _instance.notifyListeners();
  }

  static Future<void> myFcmTokenHandle(String token) async {
    await Fluttertoast.showToast(
      msg: token.isEmpty ? 'FCM token deleted' : 'FCM token received',
      backgroundColor: token.isEmpty ? Colors.red : Colors.blueAccent,
      textColor: Colors.white,
      fontSize: 16,
    );
    log.d(
      token.isEmpty ? 'Firebase token deleted' : 'Firebase Token:"$token"',
    );

    _instance._firebaseToken = token;
    _instance.notifyListeners();
  }
}

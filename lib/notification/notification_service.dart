// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class NotificationService {
//   factory NotificationService() {
//     return _notificationService;
//   }

//   NotificationService._internal();

//   static final NotificationService _notificationService =
//       NotificationService._internal();

//   final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   Future<void> init() async {
//     final initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');

//     final initializationSettingsIOS = DarwinInitializationSettings(
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );

//     final initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     tz.initializeTimeZones(); // <----
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
//   }

//   Future selectNotification(String payload) async {
//     //Handle notification tapped logic here
//   }

//   void onDidReceiveNotificationResponse(
//       NotificationResponse notificationResponse) async {
//     final String? payload = notificationResponse.payload;
//     if (notificationResponse.payload != null) {
//       print('notification payload: $payload');
//     }
//     await Navigator.push(
//       context,
//       MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
//     );
//   }

//   void onDidReceiveLocalNotification(
//     int id,
//     String title,
//     String body,
//     String payload,
//   ) async {}
// }

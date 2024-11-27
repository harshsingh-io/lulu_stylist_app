// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
// import 'package:flutter/material.dart';

// class NotificationUtils {
// /* *********************************************
//     LOCAL NOTIFICATIONS CREATION
// ************************************************ */

//   static Future<bool> createLocalNotification({
//     required BuildContext context,
//     required int id,
//     required String channelKey,
//     String? largeIconUrl,
//     String? bigPictureUrl,
//     DateTime? dateTime,
//   }) async {
//     final isAllowed = await requireUserNotificationPermissions(
//       context,
//       channelKey: channelKey,
//     );
//     if (!isAllowed) return false;

//     return AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: id,
//         channelKey: channelKey,
//         title: 'Local alert',
//         body:
//             'This notification was created locally on ${AwesomeDateUtils.parseDateToString(
//           DateTime.now(),
//         )!}${dateTime == null ? '' : (' to be displayed at ${AwesomeDateUtils.parseDateToString(
//                 dateTime,
//               )!}')}',
//         payload: {
//           'topic': 'test',
//           'articleId': '1234567890',
//           'publisherId': '',
//           'quizId': '',
//         },
//       ),
//       actionButtons: [
//         NotificationActionButton(key: 'ACCEPT', label: 'Accept'),
//         NotificationActionButton(
//           key: 'BACKGROUND',
//           label: 'Background',
//           actionType: ActionType.SilentBackgroundAction,
//         ),
//         NotificationActionButton(
//           key: 'DENY',
//           label: 'Deny',
//           isDangerousOption: true,
//         ),
//       ],
//       schedule: dateTime == null
//           ? null
//           : NotificationCalendar.fromDate(date: dateTime),
//     );
//   }

//   static Future<bool> createLocalNotificationNew({
//     required BuildContext context,
//     required int id,
//     required String channelKey,
//     String? largeIconUrl,
//     String? bigPictureUrl,
//     DateTime? dateTime,
//   }) async {
//     final isAllowed = await requireUserNotificationPermissions(
//       context,
//       channelKey: channelKey,
//     );
//     if (!isAllowed) return false;

//     return AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: id,
//         summary: 'Temp Summary',
//         channelKey: channelKey,
//         title: 'Retrograde in Mercury 🪐',
//         notificationLayout: NotificationLayout.BigPicture,
//         bigPicture: 'asset://assets/images/notification_img.png',
//         body:
//             'This notification was created locally on ${AwesomeDateUtils.parseDateToString(DateTime.now())!}${dateTime == null ? '' : (' to be displayed at ${AwesomeDateUtils.parseDateToString(dateTime)!}')}',
//         payload: {
//           'topic': 'test',
//           'articleId': '1234567890',
//           'publisherId': '',
//           'quizId': '',
//         },
//       ),
//       schedule: dateTime == null
//           ? null
//           : NotificationCalendar.fromDate(date: dateTime),
//     );
//   }

// // -----------------------------------------------------------------------------

//   static Future<bool> createOrUpdatePermanentNotification({
//     required int id,
//     required String channelKey,
//     required String title,
//     required String body,
//   }) async {
//     final isAllowed = await AwesomeNotifications().isNotificationAllowed();
//     if (!isAllowed) return false;

//     return AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: id,
//         channelKey: channelKey,
//         title: title,
//         body: body,
//         locked: true,
//         color: Colors.red,
//         backgroundColor: Colors.red,
//         autoDismissible: false,
//         largeIcon: 'asset://assets/images/notification_img.png',
//         payload: {
//           'type': 'permanent',
//           'id': 'permanent_notification',
//         },
//       ),
//     );
//   }
// // -----------------------------------------------------------------------------

// /* *********************************************
//     LIST SCHEDULED NOTIFICATIONS
// ************************************************ */

//   static Future<void> listScheduledNotifications(BuildContext context) async {
//     final activeSchedules =
//         await AwesomeNotifications().listScheduledNotifications();
//     for (final schedule in activeSchedules) {
//       print('pending notification: ['
//           'id: ${schedule.content!.id}, '
//           'title: ${schedule.content!.titleWithoutHtml}, '
//           'schedule: ${schedule.schedule}'
//           ']');
//     }
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Text('${activeSchedules.length} schedules founded'),
//           actions: [
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

// /* *********************************************
//     TIME ZONE METHODS
// ************************************************ */

//   static Future<String> getCurrentTimeZone() {
//     return AwesomeNotifications().getLocalTimeZoneIdentifier();
//   }

//   static Future<String> getUtcTimeZone() {
//     return AwesomeNotifications().getUtcTimeZoneIdentifier();
//   }

// /* *********************************************
//     BADGE NOTIFICATIONS
// ************************************************ */

//   static Future<int> getBadgeIndicator() async {
//     final amount = await AwesomeNotifications().getGlobalBadgeCounter();
//     return amount;
//   }

//   static Future<void> setBadgeIndicator(int amount) async {
//     await AwesomeNotifications().setGlobalBadgeCounter(amount);
//   }

//   static Future<void> resetBadgeIndicator() async {
//     await AwesomeNotifications().resetGlobalBadge();
//   }

// /* *********************************************
//     DELETE TOKEN FEATURES
// ************************************************ */

//   static Future<void> deleteToken() async {
//     await AwesomeNotificationsFcm().deleteToken();
//   }

//   static Future<void> requestFirebaseAppToken() async {
//     await AwesomeNotificationsFcm().requestFirebaseAppToken();
//   }

// /* *********************************************
//     TOPIC FEATURES
// ************************************************ */

//   static Future<void> subscribeToTopic(String topicName) async {
//     await AwesomeNotificationsFcm().subscribeToTopic(topicName);
//   }

//   static Future<void> unsubscribeToTopic(String topicName) async {
//     await AwesomeNotificationsFcm().unsubscribeToTopic(topicName);
//   }

// /* *********************************************
//     TRANSLATION FEATURES
// ************************************************ */

//   static Future<void> setLanguageCode(String? languageCode) async {
//     await AwesomeNotifications().setLocalization(languageCode: languageCode);
//   }

// /* *********************************************
//     CANCEL METHODS
// ************************************************ */

//   static Future<void> cancelNotification(int id) async {
//     await AwesomeNotifications().cancel(id);
//   }

//   static Future<void> dismissAllNotifications() async {
//     await AwesomeNotifications().dismissAllNotifications();
//   }

//   static Future<void> cancelAllSchedules() async {
//     await AwesomeNotifications().cancelAllSchedules();
//   }

//   static Future<void> cancelAllNotifications() async {
//     await AwesomeNotifications().cancelAll();
//   }

// /* *********************************************
//     PERMISSION METHODS
// ************************************************ */

//   static Future<bool> requireUserNotificationPermissions(
//     BuildContext context, {
//     String? channelKey,
//   }) async {
//     var isAllowed = await AwesomeNotifications().isNotificationAllowed();
//     if (!isAllowed) {
//       await showRequestUserPermissionDialog(context, channelKey: channelKey);
//       isAllowed = await AwesomeNotifications().isNotificationAllowed();
//     }
//     return isAllowed;
//   }

//   static Future<void> showPermissionPage() async {
//     await AwesomeNotifications().showNotificationConfigPage();
//   }

//   static Future<void> showNotificationConfigPage() async {
//     await AwesomeNotifications().showNotificationConfigPage();
//   }

//   static Future<void> showRequestUserPermissionDialog(
//     BuildContext context, {
//     String? channelKey,
//   }) async {
//     final theme = Theme.of(context);
//     return showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         backgroundColor: theme.highlightColor,
//         title: const Text(
//           'Get Notified!',
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
//         ),
//         content: const Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Allow Awesome Notifications to send you beautiful notifications!',
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             style: TextButton.styleFrom(backgroundColor: Colors.grey),
//             onPressed: () async {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Later', style: TextStyle(color: Colors.white)),
//           ),
//           TextButton(
//             style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
//             onPressed: () async {
//               await AwesomeNotifications()
//                   .requestPermissionToSendNotifications(channelKey: channelKey);
//               Navigator.of(context).pop();
//             },
//             child: const Text('Allow', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }

// /* *********************************************
//     PERMISSION METHODS
// ************************************************ */
// }

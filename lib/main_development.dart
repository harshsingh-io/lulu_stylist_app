import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/app/app.dart';
import 'package:lulu_stylist_app/bootstrap.dart';
import 'package:lulu_stylist_app/lulu_design_system/sa_bloc_observer.dart';
import 'package:lulu_stylist_app/notification/notification_controller.dart';
import 'package:workmanager/workmanager.dart';

// Toggle this to cause an async error to be thrown during initialization
// and to test that runZonedGuarded() catches the error
const _kShouldTestAsyncErrorOnInit = true;

// Toggle this for testing Crashlytics in your app locally.
const _kTestingCrashlytics = false;

Logger log = Logger(
  printer: PrettyPrinter(),
);

final FirebaseInAppMessaging fiam = FirebaseInAppMessaging.instance;

String _installationId = 'Unknown';

void main() {
  bootstrap(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Workmanager().initialize(callbackDispatcher);
    await HomeWidget.setAppGroupId('group.lulu_stylist_app');
    // await HomeWidget.registerBackgroundCallback(backgroundCallback);
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    // Awesome notifications
    await NotificationController.initializeLocalNotifications(debug: true);
    await NotificationController.initializeRemoteNotifications(debug: true);
    await NotificationController.getInitialNotificationAction();

    // if (await didLaunchFromHomeWidget()) {
    //   log.d(
    //     'Launched from home widget',
    //   );
    // }

    FlutterError.onError = (errorDetails) {
      // If you wish to record a "non-fatal" exception, please use `FirebaseCrashlytics.instance.recordFlutterError` instead
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      // If you wish to record a "non-fatal" exception, please remove the "fatal" parameter
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    Bloc.observer = SABlocObserver();
    // runApp( const App());
    return initializeDateFormatting().then(
      (_) => const App(),
    );
    // return const App();
  });
}

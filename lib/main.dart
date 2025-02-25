import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:flutter/material.dart';

import 'Notifications/AddNotification.dart';
import 'Notifications/NotificationController.dart';
import 'Notifications/initial_notification.dart';

///using this key to navigate to screen when notifications comes
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

///test links
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///init local notification
  LocalNotificationServices.initialize();
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static const bool isCreate = false;
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: AddNotification(),
    );
  }

//====================================================================
}

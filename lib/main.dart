// import 'package:awesome_notifications/awesome_notifications.dart';
//
// import 'package:flutter/material.dart';
//
// import 'Notifications/AddNotification.dart';
// import 'Notifications/NotificationController.dart';
// import 'Notifications/initial_notification.dart';
 import 'package:flutter_localizations/flutter_localizations.dart';
//
// ///using this key to navigate to screen when notifications comes
// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
// ///test links
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   ///init local notification
//   LocalNotificationServices.initialize();
//   return runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   static const bool isCreate = false;
//   const MyApp({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//     AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//       if (!isAllowed) {
//         AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });
//     // Only after at least the action method is set, the notification events are delivered
//     AwesomeNotifications().setListeners(
//       onActionReceivedMethod: NotificationController.onActionReceivedMethod,
//       onNotificationCreatedMethod:
//           NotificationController.onNotificationCreatedMethod,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorKey: navigatorKey,
//       debugShowCheckedModeBanner: false,
//       locale: Locale('ar', 'AE'),
//       supportedLocales: [Locale('en', 'US'), Locale('ar', 'AE')],
//       localizationsDelegates: [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       home: AddNotification(),
//     );
//   }
//
// //====================================================================
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('ar', 'AE'), // Set the locale to Arabic (right-to-left)
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AE')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: TimerPickerExample(),
    );
  }
}

class TimerPickerExample extends StatefulWidget {
  @override
  _TimerPickerExampleState createState() => _TimerPickerExampleState();
}

class _TimerPickerExampleState extends State<TimerPickerExample> {
  Duration duration = Duration(minutes: 1); // Default start from 1 minute
  int selectedHour = 1;
  int selectedMinute = 0;
  String selectedPeriod = 'AM';

  // Function to show the Cupertino action sheet with a timer picker
  void _showTimerPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('Select Time'),
            ),
          ),
          message: CupertinoPicker(
            itemExtent: 40,
            onSelectedItemChanged: (int value) {},
            children: [Text('1'), Text('2'), Text('3'), Text('4')],
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context); // Close the action sheet
              },
              child: Text('Done'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context); // Close the action sheet
            },
            isDestructiveAction: true,
            child: Text('Cancel'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cupertino Timer Picker in Action Sheet')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the selected time
            Text(
              'Selected Time: ${selectedHour}:${selectedMinute.toString().padLeft(2, '0')} $selectedPeriod',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              onPressed: _showTimerPicker, // Show the picker inside the sheet
              child: Text('Pick Time'),
            ),
          ],
        ),
      ),
    );
  }
}

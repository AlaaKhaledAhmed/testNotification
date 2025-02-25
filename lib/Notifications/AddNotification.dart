import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Notifications/MessageDetails.dart';
import 'package:untitled/Notifications/initial_notification.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({super.key});

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  bool isRepeats = true;
  Duration duration =
      Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute);
  int selectedHour = 1; // Starts from 1
  int selectedMinute = 0;
  String selectedPeriod = 'AM'; // AM or PM

  // List of hours (1-12)
  List<int> hours = List.generate(12, (index) => index + 1);
  // List of minutes (0-59)
  List<int> minutes = List.generate(60, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///send notification
            ElevatedButton(
                onPressed: () async {
                  MessageDetails m = MessageDetails(
                      id: LocalNotificationServices.uniqueId(),
                      title: 'title',
                      body: 'send notification',
                      hour: DateTime.now().hour,
                      minute: DateTime.now().minute + 1,
                      repeats: isRepeats);

                  await LocalNotificationServices.showScheduleNotification(m);
                },
                child: const Text('send notification')),

            ///send Schedule
            ElevatedButton(
                onPressed: () async {
                  MessageDetails m = MessageDetails(
                      id: LocalNotificationServices.uniqueId(),
                      title: 'title',
                      body: 'send scheduled notification',
                      hour: DateTime.now().hour,
                      minute: DateTime.now().minute + 1,
                      day: 25,
                      month: 02,
                      year: 2025);

                  await LocalNotificationServices.showScheduleNotification(m);
                },
                child: const Text('send scheduled notification')),

            ///cupolaing dialog
            ElevatedButton(
                onPressed: () => _showTimerPicker,
                child: const Text('select time')),
          ],
        ),
      ),
    );
  }

  void _showTimerPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Select Time'),
          message: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hm,
            initialTimerDuration: duration,
            onTimerDurationChanged: (Duration newDuration) {
              setState(() {
                duration = newDuration;
                selectedHour = newDuration.inHours;
                selectedMinute = newDuration.inMinutes % 60;
              });
            },
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
}

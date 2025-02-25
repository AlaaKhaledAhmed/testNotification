import 'package:flutter/material.dart';
import 'package:untitled/Notifications/MessageDetails.dart';
import 'package:untitled/Notifications/initial_notification.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({super.key});

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                MessageDetails m = MessageDetails(
                    id: LocalNotificationServices.uniqueId(),
                    title: 'title',
                    body: 'body',
                    hour: 12,
                    active: 1,
                    minute: 02,
                    day: 25,
                    month: 02,
                    year: 2025);
                m.repeats = m.day == null ? true : false;
                await LocalNotificationServices.showScheduleNotification(m);
              },
              child: const Text('send notification'))),
    );
  }
}

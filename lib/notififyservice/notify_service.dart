import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';



class LocalNotificationService{

  static void initialize() {

    AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: 'key2',
              channelName: 'register',
              channelDescription: 'Fitness App Notification',
              defaultColor: Colors.deepOrangeAccent,
              playSound: true,
              enableLights: true,
              enableVibration: true,
              vibrationPattern: highVibrationPattern,
              importance: NotificationImportance.High
          )
        ]
    );

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });


  }

  static void createanddisplaynotification(RemoteMessage message) async {
    try {
      String timeZon = await AwesomeNotifications().getLocalTimeZoneIdentifier();
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: message.data['android_channel_id'],
          title: message.notification!.title,
          body: message.notification!.body,
          bigPicture: 'resource://drawable/bigicon',
          icon:'resource://drawable/fitness',
          largeIcon:'resource://drawable/fitness',
          customSound: 'app/src/main/res/raw/i-did-it-message-tone.mp3',
          backgroundColor: Colors.grey,
          displayOnBackground: true,
          displayOnForeground: true,
        ),
        actionButtons: [
          NotificationActionButton(
            key: "accept",
            label: "Accept",
          ),
          NotificationActionButton(
            key: "cancel",
            label: "Cancel",
          )
        ],
        schedule: NotificationInterval(interval: 1, timeZone: timeZon, repeats: false, preciseAlarm: true),
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/subjects.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;
//
// class LocalNotificationService {
//   LocalNotificationService();
//
//   final _localNotificationService = FlutterLocalNotificationsPlugin();
//
//   final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();
//
//   Future<void> intialize() async {
//     tz.initializeTimeZones();
//     const AndroidInitializationSettings androidInitializationSettings =
//     AndroidInitializationSettings('@drawable/ic_stat_android');
//
//     IOSInitializationSettings iosInitializationSettings =
//     IOSInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );
//
//     final InitializationSettings settings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iosInitializationSettings,
//     );
//
//     await _localNotificationService.initialize(
//       settings,
//       onSelectNotification: onSelectNotification,
//     );
//   }
//
//   Future<NotificationDetails> _notificationDetails() async {
//     const AndroidNotificationDetails androidNotificationDetails =
//     AndroidNotificationDetails('channel_id', 'channel_name',
//         channelDescription: 'description',
//         importance: Importance.max,
//         priority: Priority.max,
//         playSound: true);
//
//     const IOSNotificationDetails iosNotificationDetails =
//     IOSNotificationDetails();
//
//     return const NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: iosNotificationDetails,
//     );
//   }
//
//   Future<void> showNotification({
//     required int id,
//     required String title,
//     required String body,
//   }) async {
//     final details = await _notificationDetails();
//     await _localNotificationService.show(id, title, body, details);
//   }
//
//   Future<void> showScheduledNotification(
//       {required int id,
//         required String title,
//         required String body,
//         required int seconds}) async {
//     final details = await _notificationDetails();
//     await _localNotificationService.zonedSchedule(
//       id,
//       title,
//       body,
//       tz.TZDateTime.from(
//         DateTime.now().add(Duration(seconds: seconds)),
//         tz.local,
//       ),
//       details,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
//
//   Future<void> showNotificationWithPayload(
//       {required int id,
//         required String title,
//         required String body,
//         required String payload}) async {
//     final details = await _notificationDetails();
//     await _localNotificationService.show(id, title, body, details,
//         payload: payload);
//   }
//
//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) {
//     print('id $id');
//   }
//
//   void onSelectNotification(String? payload) {
//     print('payload $payload');
//     if (payload != null && payload.isNotEmpty) {
//       onNotificationClick.add(payload);
//     }
//   }
// }
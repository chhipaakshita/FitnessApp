

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


import 'notify_service.dart';

class NotificationSend{
  static void registerNotification() async {
    late final FirebaseMessaging _messaging;
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        provisional: false,
        sound: true
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await FirebaseMessaging.instance.getToken();
      print('token: $token');

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("Data on App open ${message.data}");
          print("Notification on App open ${message.notification}");
          //LocalNotificationService.createanddisplaynotification(message);
        }
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (message != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("Data on Message ${message.data}");
          print("Notification on Message ${message.notification?.title}");
          //LocalNotificationService.createanddisplaynotification(message);
        }
      });
    } else {
      print("permission declined by user");
    }
  }

}
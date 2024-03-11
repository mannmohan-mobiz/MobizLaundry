import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:golden_falcon/Picker_App/screens/home_page_new.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  "High Importance Notifications",
  description: "This channel is used important notification",
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationplugin = FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("Handling a background message : ${message.messageId}");
  debugPrint(message.data.toString());
}

class FirebaseNotifcation {
  BuildContext? context;

  FirebaseNotifcation(this.context);

  initialize() async {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await flutterLocalNotificationplugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    var intializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(android: intializationSettingsAndroid);

    flutterLocalNotificationplugin.initialize(initializationSettings);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Navigator.push(context!, MaterialPageRoute(builder: (context) => const HomePageNew()));
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        AndroidNotificationDetails notificationDetails = AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            importance: Importance.max,
            priority: Priority.high,
            groupKey: channel.groupId);
        NotificationDetails notificationDetailsPlatformSpefics = NotificationDetails(android: notificationDetails);
        flutterLocalNotificationplugin.show(
            notification.hashCode, notification.title, notification.body, notificationDetailsPlatformSpefics);
      }
    });

    if (Platform.isIOS) {
      await FirebaseMessaging.instance.getAPNSToken();
    }
  }

  Future<String> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    debugPrint(token);
    return token!;
  }

  subscribeToTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }
}

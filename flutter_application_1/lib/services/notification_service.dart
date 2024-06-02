import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void initialize() {
    // Request permissions on iOS
    _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print(
            'Received a message while in the foreground: ${message.messageId}');
      }
      if (message.notification != null) {
        // ignore: avoid_print
        print('Message also contained a notification: ${message.notification}');
        _showNotification(message);
      }
    });

    // Handle background messages
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // ignore: avoid_print
      print('Message clicked! Data: ${message.data}');
      // Navigate to specific screen if needed
    });

    // Get the device token for sending notifications
    _firebaseMessaging.getToken().then((String? token) {
      if (kDebugMode) {
        print('Device Token: $token');
      }
    });
  }

  void _showNotification(RemoteMessage message) {
    // Customize this function to show notifications using flutter_local_notifications or another package
    // This example just prints the notification
    // ignore: avoid_print
    print('Notification Title: ${message.notification?.title}');
    // ignore: avoid_print
    print('Notification Body: ${message.notification?.body}');
  }
}

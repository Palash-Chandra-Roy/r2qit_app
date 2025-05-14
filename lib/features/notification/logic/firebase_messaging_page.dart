import 'package:firebase_messaging/firebase_messaging.dart';

import 'get_fid_with_inappNotification.dart';
import 'notification_device_save.dart';

class FirebaseMessageController {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  // Entry point for notification setup
  @pragma("vm:entry-point")
  // Request notification permission from the user
  notificationPermission() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // Permission granted
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      // Provisional permission granted
    } else {
      // Permission denied or restricted
    }
  }

  // Initialize Firebase Cloud Messaging (FCM)
  initsFCM() async {
    String? token = await firebaseMessaging.getToken();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
    FirebaseMessaging.onBackgroundMessage(handleNotification);

    // Get the FID (Firebase Instance ID) and send device token
    String fid = await FID();
    if (token != null) {
      notificationDeviceToken(token: token, fid: fid);
    }
  }
}

// Handle incoming notifications
Future<void> handleNotification(RemoteMessage msg) async {
  // Add logic to handle the notification here
}

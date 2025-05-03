import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessageControler {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  @pragma("vm:entry-point")
  static void notificationSetup() async {
    FirebaseMessaging.onMessage.listen((message) {
      // Logger().e("Notification name: ${message.notification!.title.toString()}");
      // Logger().e("Notification name: ${message.notification!.body.toString()}");
    });
  }

  notificationPermiton() async {
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
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {}
  }

  initsFCM() async {
    var token = await firebaseMessaging.getToken();
    FirebaseMessaging.onBackgroundMessage(hendleNotification);
    FirebaseMessaging.onMessage.listen(hendleNotification);
  }
}

Future<void> hendleNotification(RemoteMessage msg) async {}

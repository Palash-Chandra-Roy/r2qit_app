import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

class FirebaseMessageControler {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  @pragma("vm:entry-point")
  static void notificationSetup() async {
    FirebaseMessaging.onMessage.listen((message) {
      Logger()
          .e("Notification name: ${message.notification!.title.toString()}");
      Logger().e("Notification name: ${message.notification!.body.toString()}");
    });
  }

  initsFCM() async {
    await firebaseMessaging.requestPermission();
    var token = await firebaseMessaging.getToken();
    Logger().e("message token: $token");
    FirebaseMessaging.onBackgroundMessage(hendleNotification);
    FirebaseMessaging.onMessage.listen(hendleNotification);
  }
}

Future<void> hendleNotification(RemoteMessage msg) async {}

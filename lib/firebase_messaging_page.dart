import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

class FirebaseMsg {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  initsFCM() async {
    await firebaseMessaging.requestPermission();
    var token = await firebaseMessaging.getToken();
    Logger().e("message token: $token");
    FirebaseMessaging.onBackgroundMessage(hendleNotification);
    FirebaseMessaging.onMessage.listen(hendleNotification);
  }
}

Future<void> hendleNotification(RemoteMessage msgt) async {}

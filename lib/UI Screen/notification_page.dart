import 'package:flutter/material.dart';

import '../Coustom_Widget/custom_notification_fild.dart';
import '../firebase_messaging_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomNotificationFild(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      FirebaseMessageControler.notificationSetup();
      FirebaseMessageControler().initsFCM();
      FirebaseMessageControler().notificationPermiton();
    });
  }
}

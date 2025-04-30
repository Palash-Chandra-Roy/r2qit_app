import 'package:flutter/material.dart';
import 'package:r2ait_app/model/notification_model.dart';

class NotificationControler {
  static List<NotificationModel> notificationList = [
    NotificationModel(
      title: 'New Message',
      subtitle: 'You have received a new message',
      time: '2 min ago',
      icon: Icons.message,
      isRead: false,
    ),
    NotificationModel(
      title: 'System Alert',
      subtitle: 'Update available for your app',
      time: '1 hour ago',
      icon: Icons.system_update,
      isRead: false,
    ),
    NotificationModel(
      title: 'Profile View',
      subtitle: 'Someone viewed your profile',
      time: 'Yesterday',
      icon: Icons.person,
      isRead: false,
    ),
    NotificationModel(
      title: 'System Alert',
      subtitle: 'Update available for your app',
      time: '1 hour ago',
      icon: Icons.system_update,
      isRead: false,
    ),
    NotificationModel(
      title: 'Profile View',
      subtitle: 'Someone viewed your profile',
      time: 'Yesterday',
      icon: Icons.person,
      isRead: false,
    ),
    NotificationModel(
      title: 'System Alert',
      subtitle: 'Update available for your app',
      time: '1 hour ago',
      icon: Icons.system_update,
      isRead: false,
    ),
    NotificationModel(
      title: 'Profile View',
      subtitle: 'Someone viewed your profile',
      time: 'Yesterday',
      icon: Icons.person,
      isRead: false,
    ),
  ];
}

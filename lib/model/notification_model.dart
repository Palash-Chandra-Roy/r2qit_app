import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationModel {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;
  final RxBool isRead;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    required bool isRead,
  }) : isRead = isRead.obs;

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'],
      subtitle: map['subtitle'],
      time: map['time'],
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'), // important!
      isRead: map['isRead'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'time': time,
      'icon': icon.codePoint, // Save icon as int
      'isRead': isRead.value, // Save RxBool as normal bool
    };
  }
}

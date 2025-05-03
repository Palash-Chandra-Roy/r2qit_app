import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../utils/notification_controller/notification_controler.dart';

class CustomNotificationFild extends StatelessWidget {
  CustomNotificationFild({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Notification mark all
        Row(
          children: [
            Spacer(),
            InkWell(
              onTap: () => ReadControler().allRead(),
              child: Container(
                // width: width,
                alignment: Alignment.topRight,
                height: height * 0.03,

                margin: EdgeInsets.only(right: 10, bottom: 10),
                child: Text(
                  "Mark All",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: NotificationControler.notificationList.length,
            itemBuilder: (context, index) {
              final notification =
                  NotificationControler.notificationList[index];
              return Obx(() => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: notification.isRead.value
                            ? Colors.white
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          child: Icon(notification.icon),
                        ),
                        title: Row(children: [Text("${notification.title}")]),
                        subtitle: Text("${notification.subtitle}"),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("${notification.time}"),
                            const SizedBox(height: 4),
                            CircleAvatar(
                                radius: 6,
                                backgroundColor: notification.isRead.value
                                    ? Colors.transparent
                                    : Colors.red),
                          ],
                        ),
                        onTap: () => ReadControler().singleRead(index),
                      ),
                    ),
                  ));
            },
          ),
        )
      ],
    );
  }
}

class ReadControler extends GetxController {
  var notificationList = NotificationControler.notificationList.obs;

  void singleRead(int index) {
    notificationList[index].isRead.value = true;
    Logger().e("${notificationList[index].isRead.value}");
  }

  void allRead() {
    for (var notification in notificationList) {
      notification.isRead.value = true;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/admin_check.dart';

class CustomServicesList extends StatelessWidget {
  final service;
  final VoidCallback goToDetailsPage;
  CustomServicesList({
    super.key,
    required this.service,
    required this.goToDetailsPage,
  });
  final ServiceControl _serviceControl = Get.find<ServiceControl>();

  @override
  Widget build(BuildContext context) {
    if (_serviceControl.isAdmin.value == false) {
      return GestureDetector(
        onTap: goToDetailsPage,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("${service.image}"),
            ),
            title: Text("${service.name}"),
          ),
        ),
      );
    }
    return Dismissible(
      key: Key(service.name.toString()),
      direction: DismissDirection.horizontal, // দুদিকেই swipe করা যাবে
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          final deletedService = service;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${deletedService.name} deleted"),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {},
              ),
            ),
          );
        } else {
          Get.snackbar(
            "Edit",
            "You don't have permission to edit this service.",
            backgroundColor: Colors.orange,
            colorText: Colors.white,
            duration: const Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("${service.image}"),
          ),
          title: Text("${service.name}"),
          trailing: const SizedBox.shrink(),
          onTap: goToDetailsPage,
        ),
      ),
    );
    ;
  }
}

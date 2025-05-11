import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> DeleteShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Delete Confirmation"),
        content: Text("Are you sure you want to delete this item?"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              print("Item deleted");
              Get.back();
            },
            child: Text("Yes", style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}

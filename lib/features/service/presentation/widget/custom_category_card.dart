import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/admin_check.dart';
import 'custom_delete_show_dialog.dart';

class CustomServicesCard extends StatelessWidget {
  final services;
  CustomServicesCard({
    super.key,
    required this.services,
  });
  ServiceControl _serviceControl = Get.find<ServiceControl>();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 8,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      services.image,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  services.name,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 3),
                Text(
                  services.discription,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          _serviceControl.isAdmin
              ? Positioned(
                  bottom: -8,
                  left: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.delete_outline_sharp,
                      color: Colors.blue,
                      size: 16,
                    ),
                    onPressed: () {
                      DeleteShowDialog(context);
                    },
                  ),
                )
              : Text(""),
          _serviceControl.isAdmin
              ? Positioned(
                  bottom: -8,
                  right: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                      size: 16,
                    ),
                    onPressed: () {},
                  ),
                )
              : Text("")
        ],
      ),
    );
  }
}

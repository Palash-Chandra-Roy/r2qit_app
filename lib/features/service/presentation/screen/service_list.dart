import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/core/constants/controller_control/home_controller.dart';

import '../../../service_details/presentation/screen/service_details.dart';

class ServiceListPage extends StatelessWidget {
  HomeController serviceList = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service List'),
      ),
      body: ListView.builder(
        itemCount: serviceList.serviceCategories.length,
        itemBuilder: (context, index) {
          final ServiceCategory service = serviceList.serviceCategories[index];
          return GestureDetector(
            onTap: () {
              goToDetailsPage();
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("${service.image}"),
                ),
                title: Text("${service.name}"),
                onTap: () {
                  goToDetailsPage();
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void goToDetailsPage() {
    Get.to(() => ServiceDetails());
  }
}

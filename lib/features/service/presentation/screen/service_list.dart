import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/core/constants/controller_control/home_controller.dart';

import '../../logic/admin_check.dart';
import '../widget/custom_service_list.dart';
import 'project_details.dart';

class ServiceListPage extends StatelessWidget {
  HomeController serviceList = HomeController();
  ServiceControl _serviceControl = Get.find<ServiceControl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _serviceControl.isAdmin.value
              ? IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    // Add your action here
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                )
              : Text("")
        ],
        title: Center(child: Text('Service List')),
      ),
      body: ListView.builder(
        itemCount: serviceList.serviceCategories.length,
        itemBuilder: (context, index) {
          final ServiceCategory service = serviceList.serviceCategories[index];
          return CustomServicesList(
            service: service,
            goToDetailsPage: goToDetailsPage,
          );
        },
      ),
    );
  }

  void goToDetailsPage() {
    Get.to(() => ServiceDetails());
  }
}

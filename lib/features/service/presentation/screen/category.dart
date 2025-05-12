import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/service_controller.dart';
import '../widget/custom_category_card.dart';
import '../widget/custom_category_topper_text.dart';

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  final ServiceController _serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Section
              service_toper_text(),
              Divider(),
              Expanded(
                child: Obx(() {
                  if (_serviceController.services.isEmpty) {
                    return const Center(child: Text("No services available"));
                  }
                  return GridView.builder(
                    primary: true,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 1,
                    ),
                    itemCount: _serviceController.services.length,
                    itemBuilder: (context, index) {
                      final services = _serviceController.services[index];
                      return CustomServicesCard(
                        services: services,
                      );
                    },
                  );
                }),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

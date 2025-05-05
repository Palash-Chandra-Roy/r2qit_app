import 'package:flutter/material.dart';
import 'package:r2ait_app/core/constants/controller_control/home_controller.dart';

import '../../../../widgets/custom_project_details.dart';

class ServiceDetails extends StatelessWidget {
  final HomeController serviceList = HomeController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Our Project'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage("assets/images/project-group.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 12,
                childAspectRatio: 1.9 / 2.4,
              ),
              itemCount: serviceList.serviceCategories.length,
              itemBuilder: (context, index) {
                final service = serviceList.serviceCategories[index];
                return CustomServiceDetailsCard(
                  service: service,
                  goToDetailsPage: goToDetailsPage,
                );
              },
            ),
          ),
        ]),
      ),

      // Bottom Bar for price, payment & cart
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$25",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Payment logic
                  },
                  icon: Icon(Icons.payment),
                  label: Text("Buy Now"),
                ),
                SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    // Cart logic
                  },
                  icon: Icon(Icons.shopping_cart),
                  label: Text("Cart"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void goToDetailsPage() {}
}

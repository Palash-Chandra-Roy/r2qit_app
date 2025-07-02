// views/carts.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/features/carts/data/cart_controller.dart';
import 'package:r2ait_app/widgets/customappbar.dart';

class Carts extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(title: " My Cart"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(() => ListView.builder(
              itemCount: controller.fruits.length,
              itemBuilder: (context, index) {
                final fruit = controller.fruits[index];
                return Dismissible(
                  key: Key(fruit.name),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    controller.removeItem(index);
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.delete, color: Colors.red),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Image.asset(fruit.image, width: 90, height: 90),
                        SizedBox(width: 30),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(fruit.name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text("Price: \$${fruit.price}",
                                  style: TextStyle(color: Colors.grey[700])),
                              Row(
                                children: [
                                  IconButton(
                                    icon:
                                        Icon(Icons.remove, color: Colors.black),
                                    onPressed: () =>
                                        controller.decreaseQty(index),
                                  ),
                                  Text("${fruit.quantity}"),
                                  IconButton(
                                    icon: Icon(Icons.add, color: Colors.green),
                                    onPressed: () =>
                                        controller.increaseQty(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:r2ait_app/core/constants/controller_control/home_controller.dart';

class ServiceDetails extends StatelessWidget {
  final HomeController serviceList = HomeController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2 / 2.4,
          ),
          itemCount: serviceList.serviceCategories.length,
          itemBuilder: (context, index) {
            final service = serviceList.serviceCategories[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(12), // কোনার রাউন্ড
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://www.shutterstock.com/image-photo/moraine-lake-alberta-canada-beautiful-600nw-2530299163.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 25,
                          ),
                          onPressed: () {
                            // Favorite logic
                          },
                        ),
                      ),
                      SizedBox(height: height * 0.1),
                      Text(
                        service.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white, // White text for visibility
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.transparent.withOpacity(0.2)),
                          onPressed: () => goToDetailsPage(),
                          child: Text(
                            "See Live",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
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

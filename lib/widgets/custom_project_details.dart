import 'package:flutter/material.dart';

class CustomServiceDetailsCard extends StatelessWidget {
  var service;
  VoidCallback goToDetailsPage;
  CustomServiceDetailsCard(
      {super.key, required this.service, required this.goToDetailsPage});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: height * 0.2,
        width: 200,
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🖼️ Image with Favorite button using Stack
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    "assets/images/web.jpeg",
                    height: height * 0.18,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
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
              ],
            ),

            // 📄 Service Name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.5),
              child: Text(
                service.name ?? "",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // 🔘 See Live Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade500,
                  ),
                  onPressed: () => goToDetailsPage(),
                  child: Text(
                    "See Live",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

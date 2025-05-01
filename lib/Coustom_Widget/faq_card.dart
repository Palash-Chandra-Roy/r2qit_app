import 'package:flutter/material.dart';

class CustomServiceCard extends StatelessWidget {
  IconData icon;
  String title;
  String subtitle;
  Color? color;
  CustomServiceCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.color});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Container(
      height: height * 0.14,
      width: width * 0.35,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15), // চাইলে গোল কোণ
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon),
            SizedBox(
              height: height * 0.040,
            ),
            Text(
              "$title",
              style: TextStyle(fontSize: 10),
            ),
            Text(
              "$subtitle",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

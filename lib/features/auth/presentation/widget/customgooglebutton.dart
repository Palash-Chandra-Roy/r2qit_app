import 'package:flutter/material.dart';
import 'package:r2ait_app/core/constants/fontsize_control/widget_support.dart';

class Customgooglebutton extends StatelessWidget {
  final VoidCallback onTap;

  const Customgooglebutton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 2, color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/google.png",
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Text(
              "Continue with Google",
              style: AppWidget.appBarTextFeildStyle(),
            ),
          ],
        ),
      ),
    );
  }
}

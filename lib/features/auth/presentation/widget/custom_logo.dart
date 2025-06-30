import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 200,
      child: Image.asset(
        "assets/images/logo.png",
      ),
    );
  }
}

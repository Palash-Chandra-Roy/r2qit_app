import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/Screen/BottomNavBar/bottom_navbar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to Home Screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() =>
          //HomeScreen()
          BottomNavbarScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: Image.asset(
            "assets/images/company_logo.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

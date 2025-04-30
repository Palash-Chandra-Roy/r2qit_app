import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/UI%20Screen/signin.dart';

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
              Signin()
          //BottomNavbarScreen()
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

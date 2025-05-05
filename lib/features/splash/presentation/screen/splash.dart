import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:r2ait_app/features/auth/presentation/screen/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/color_control/color_controller.dart';
import '../../../home/presentation/screen/home.dart';

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

    Future<void> checkEmail() async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      String? email = _prefs.getString("email");
      if (email != null && email.isNotEmpty) {
        Get.to(() => Home());
        Logger().e("email is not null: $email");
      } else {
        Get.to(() => Signin());
      }
    }

    Future.delayed(Duration(seconds: 3), () async {
      checkEmail();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashColor,
      body: Center(
        child: Container(
          height: 120,
          width: 200,
          child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

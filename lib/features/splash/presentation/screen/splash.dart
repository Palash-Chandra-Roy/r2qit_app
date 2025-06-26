import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/features/auth/presentation/screen/signin.dart';
import 'package:r2ait_app/utils/admin_check.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/color_control/color_controller.dart';
import '../../../../widgets/bottom_navbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final ServiceControl _serviceControl = Get.find<ServiceControl>();

class _SplashScreenState extends State<SplashScreen> {


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
  @override
  void initState() {
    super.initState();
    // Navigate to Home Screen after 3 seconds
    _serviceControl.checkAdmin();
    Future<void> checkEmail() async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      String? id = _prefs.getString("id");
      if (id != null && id.isNotEmpty) {
        Get.to(() => BottomNavbar());
      } else {
        Get.to(() => Signin());
      }
    }
    Future.delayed(Duration(seconds: 3), () async {
      checkEmail();
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:r2ait_app/utils/admin_check.dart';
import '../../../../core/constants/color_control/color_controller.dart';
import '../../../../widget/custom_logo.dart';
import '../../logic/check_login_status.dart';

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
      body: Padding(
        padding: EdgeInsets.all(3.r),
        child: Center(
          child: Column(
            children: [
              const  Spacer(),
              const CustomLogo(),
              const  Spacer(),
              const CircularProgressIndicator(),
                SizedBox(height: 10.h),
             Text("version 1.0.0",style: TextStyle(color:Colors.grey),)
            ],
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
    Future.delayed(Duration(seconds: 3), () async {
      CheckLoginStatus().checkLoginStatus();
    });
  }
}

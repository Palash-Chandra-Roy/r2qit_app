import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 290.w,
      child: Image.asset(
        "assets/images/logo.png",
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/custom_logo.dart';
import 'custom_sign_text.dart';
class LogoAndText extends StatelessWidget {
  const LogoAndText({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.w,),
        CustomLogo(),
        CustomSignText(),
        SizedBox(height: 15.w,),
      ],
    );
  }
}

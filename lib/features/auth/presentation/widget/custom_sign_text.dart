import 'package:flutter/material.dart';

import '../../../../core/constants/fontsize_control/widget_support.dart';

class CustomSignText extends StatelessWidget {
  const CustomSignText({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double height = size.height;
    //double width = size.width;
    return Column(
      children: [
        Text("Sign In", style: AppWidget.hederTextFeildStyle()),
        SizedBox(height: height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 90,
                height: 4,
                color: const Color.fromARGB(255, 4, 56, 5)),
            SizedBox(width: 5),
            Container(
                width: 90,
                height: 4,
                color: const Color.fromARGB(255, 121, 13, 6)),
          ],
        ),
        SizedBox(height: height * 0.03),
      ],
    );
  }
}

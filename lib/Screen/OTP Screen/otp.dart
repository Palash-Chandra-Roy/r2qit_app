import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:r2ait_app/Coustom_Widget/CustomBottom/custom_bottom.dart';
import 'package:r2ait_app/Coustom_Widget/CustomTextFromField/custom_text_from_field.dart';
import 'package:r2ait_app/Screen/Verify%20Screen/verify.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 14,
              color: Colors.black,
            )),
        title: Text(
          "Forgot Password ",
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/frame.png",
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(
              height: screenheight * 0.01,
            ),
            Text(
              "Please Enter your email to reset your password",
              style: TextStyle(fontSize: 16, color: Color(0xFF5C5C5C)),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            CustomTextFormField(
              hintText: "Email",
              autocorrect: true,
              obscureText: true,

              //fillColor: Colors.white70,
              prefixIcon: Icon(Icons.email),
              filled: true,
              //obscureText: true,
              keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return "Enter your Email";
              //   } else {
              //     return null!;
              //   }
              // },
            ),
            SizedBox(
              height: screenheight * 0.2,
            ),
            CustomButtom(
                buttomText: "Send OTP ",
                color: Color(0xFFA020F0),
                onPressed: () {
                  Get.to(Verify());
                },
                textColor: Colors.black),
          ],
        ),
      ),
    );
  }
}

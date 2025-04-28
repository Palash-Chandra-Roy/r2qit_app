import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/Coustom_Widget/custombuttom.dart';
import 'package:r2ait_app/Coustom_Widget/customtextfromfield.dart';
import 'package:r2ait_app/UI%20Screen/verify.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    //double screenWidth = MediaQuery.of(context).size.width;
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
              height: screenHeight * 0.01,
            ),
            Text(
              "Please Enter your email to reset your password",
              style: TextStyle(fontSize: 16, color: Color(0xFF5C5C5C)),
            ),
            SizedBox(
              height: screenHeight * 0.02,
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
              height: screenHeight * 0.2,
            ),
            CustomButton(
                buttonText: "Send OTP ",
                color: Color(0xFFA020F0),
                onPressed: () {
                  Get.to(Verify());
                },
                textColor: Colors.black)
          ],
        ),
      ),
    );
  }
}

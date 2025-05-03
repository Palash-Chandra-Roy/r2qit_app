import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/features/auth/presentation/screen/verify.dart';

import '../../../../core/constants/Controller/otp_controller.dart';
import '../../../../core/constants/fontsize_control/widget_support.dart';
import '../widget/custombuttom.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});
  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  OtpController otpController = Get.put(OtpController());
  final _formKey = GlobalKey<FormState>();
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
        title:
            Text("Forgot Password ", style: AppWidget.appBarTextFeildStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKey,
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
                style: AppWidget.greyTextFeildStyle(),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: otpController.emailController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return "Please enter a valid email";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: screenHeight * 0.2,
              ),
              CustomButton(
                  buttonText: "Send OTP ",
                  color: const Color.fromARGB(255, 4, 56, 5),
                  onPressed: gotoVerify,
                  textColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }

  void gotoVerify() {
    if (_formKey.currentState?.validate() ?? false) {
      print("✅ Form Validated");
      Get.to(Verify());
    }
  }
}

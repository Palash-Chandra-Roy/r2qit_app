import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:r2ait_app/features/auth/presentation/screen/forget.dart';
import 'package:r2ait_app/features/auth/presentation/widget/custom_logo.dart';

import '../../../../core/constants/fontsize_control/widget_support.dart';
import '../widget/custombuttom.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  bool hasError = false;
  String currentText = "";
  final _formKey = GlobalKey<FormState>();

  TextEditingController verifyController = Get.put(TextEditingController());

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
          "Verify Gmail",
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  child: CustomLogo(),
                ),
                Text(
                  "We have sand a verification code your email  \n Please Check you email enter the code ",
                  style: AppWidget.greyTextFeildStyle(),
                ),
                SizedBox(
                  height: screenheight * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 30,
                  ),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: false,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 6) {
                        return "I'm from validator";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: verifyController,
                    keyboardType: TextInputType.multiline,
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      return true;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenWidth * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "didn't get the code?",
                      style: AppWidget.greyTextFeildStyle(),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'Resent',
                        style: AppWidget.brand1TextFeildStyle(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenheight * 0.2,
                ),
                CustomButton(
                    buttonText: "Verify",
                    color: const Color.fromARGB(255, 4, 56, 5),
                    onPressed: gotoforget,
                    textColor: Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void gotoforget() {
    if (_formKey.currentState?.validate() ?? false) {
      print("✅ Form Validated ");
      Get.to(Forget());
    }
  }
}

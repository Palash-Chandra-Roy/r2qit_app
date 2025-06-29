import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/features/auth/presentation/screen/signin.dart';
import 'package:r2ait_app/features/auth/presentation/widget/custom_logo.dart';
import 'package:r2ait_app/features/auth/presentation/widget/newpassword_text.dart';

import '../../../../core/constants/controller_control/forget_controller.dart';
import '../../../../core/constants/fontsize_control/widget_support.dart';
import '../widget/custombuttom.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  final ForgetController forgetController = Get.put(ForgetController());

  bool obscureText = true;
  bool obscuresText = true;
  bool isCheck = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.black),
        ),
        title: const Text(
          "Create New Password",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: screenheight / 4,
                  child: CustomLogo(),
                ),
                SizedBox(height: screenheight * 0.02),
                Text("Create Your New Password",
                    style: AppWidget.appBarTextFeildStyle()),
                SizedBox(height: screenheight * 0.03),
                CustomPasswordField(
                  controller: forgetController.newPasswordController,
                  obscureText: forgetController.obscureNewPassword,
                  hintText: "New Password",
                ),
                SizedBox(height: screenheight * 0.02),
                CustomPasswordField(
                  controller: forgetController.confirmPasswordController,
                  obscureText: forgetController.obscureConfirmPassword,
                  hintText: " Confirm Password",
                ),
                SizedBox(height: screenheight * 0.1),
                CustomButton(
                  buttonText: "Continue",
                  color: const Color.fromARGB(255, 4, 56, 5),
                  textColor: Colors.white,
                  onPressed: gotoSigninPage,
                ),
                SizedBox(height: screenheight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void gotoSigninPage() {
    if (_formKey.currentState?.validate() ?? false) {
      final newPassword = forgetController.newPasswordController.text.trim();
      final confirmPassword =
          forgetController.confirmPasswordController.text.trim();

      if (newPassword != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Passwords do not match",
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (!isCheck) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please agree to the terms & conditions."),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }
      Get.offAll(() => const Signin());
    }
  }
}

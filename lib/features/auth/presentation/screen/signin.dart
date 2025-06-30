import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:r2ait_app/features/auth/logic/login_controller.dart';
import 'package:r2ait_app/features/auth/presentation/screen/google.dart';
import 'package:r2ait_app/features/auth/presentation/screen/otp.dart';
import 'package:r2ait_app/features/auth/presentation/screen/signup.dart';
import 'package:r2ait_app/features/auth/presentation/widget/custom_sign_text.dart';
import 'package:r2ait_app/features/auth/presentation/widget/custom_text_from_email.dart';
import 'package:r2ait_app/features/auth/presentation/widget/custom_text_from_password.dart';
import 'package:r2ait_app/features/auth/presentation/widget/customgooglebutton.dart';
import 'package:r2ait_app/features/home/presentation/screen/home.dart';
import 'package:r2ait_app/widget/custom_logo.dart';

import '../../../../core/constants/fontsize_control/widget_support.dart';
import '../../logic/signin_controller.dart';
import '../widget/custombuttom.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  SigninController signinController = Get.put(SigninController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenheight * 0.1,
                ),
                CustomLogo(),
                CustomSignText(),
                // Email
                //CustomTextField(),
                CustomTextFromEmail(
                    controller: signinController.userOrEmailController,
                    icon: Icons.email),
                SizedBox(height: screenheight * 0.01),
                CustomTextFromPassword(
                  controller: signinController.passwordController,
                  obscureText: signinController.obscurePassword,
                  hintText: "Password",
                ),
                InkWell(
                  onTap: () {
                    Get.to(OTP());
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text("Forgot Password?",
                        style: AppWidget.simpleTextFeildStyle()),
                  ),
                ),
                SizedBox(height: screenheight * 0.01),
                Customgooglebutton(onTap: () {
                  googleLogin();
                }),
                SizedBox(height: screenheight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Checkbox(
                          value: signinController.isCheck.value,
                          onChanged: (val) {
                            signinController.isCheck.value = val ?? false;
                          },
                        )),
                    GestureDetector(
                      onTap: () {
                        signinController.isCheck.value =
                            !signinController.isCheck.value;
                      },
                      child: Text("Remember me"),
                    )
                  ],
                ),

                SizedBox(height: screenheight * 0.02),

                CustomButton(
                  buttonText: "Sign In",
                  color: const Color.fromARGB(255, 4, 56, 5),
                  textColor: Colors.white,
                  onPressed: () {
                    String email = signinController.userOrEmailController.text;
                    String password = signinController.passwordController.text;

                    if (signinController.isCheck.value) {
                      print("Remembered credentials: $email / $password");
                    } else {
                      print("Not remembering credentials");
                    }
                    login();
                  },
                ),
                SizedBox(height: screenheight * 0.02),
                // Go to Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account?",
                        style: AppWidget.appBarTextFeildStyle()),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        Get.to(Signup()); // Navigate to signup screen
                      },
                      child: Text('Sign Up!',
                          style: AppWidget.brand1TextFeildStyle()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (_formKey.currentState?.validate() ?? false) {
      LoginController.login(
        user_or_email: signinController.userOrEmailController.text.trim(),
        password: signinController.passwordController.text.trim(),
      );
    }
  }

  void googleLogin() async {
    final user = await AuthServiceGoogle().signInWithGoogle();
    if (user != null) {
      Logger().e(user.additionalUserInfo);
      Get.offAll(Home());
    }
  }
}

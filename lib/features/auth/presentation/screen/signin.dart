import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:r2ait_app/features/auth/logic/login_controller.dart';
import 'package:r2ait_app/features/auth/presentation/screen/google.dart';
import 'package:r2ait_app/features/auth/presentation/screen/otp.dart';
import 'package:r2ait_app/features/auth/presentation/screen/signup.dart';
import 'package:r2ait_app/features/auth/presentation/widget/custom_text_from_email.dart';
import 'package:r2ait_app/features/auth/presentation/widget/custom_text_from_password.dart';
import 'package:r2ait_app/features/auth/presentation/widget/customgooglebutton.dart';
import 'package:r2ait_app/features/home/presentation/screen/home.dart';

import '../../../../core/constants/controller_control/signin_controller.dart';
import '../../../../core/constants/fontsize_control/widget_support.dart';
import '../widget/custom_logo.dart';
import '../widget/custom_sign_text.dart';
import '../widget/custombuttom.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  SigninController signinController = Get.put(SigninController());
  var isCheck = false.obs;
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                // Google Sign In (optional)

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

                SizedBox(height: 30),

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
          user_or_email: signinController.userOrEmailController.text,
          password: signinController.passwordController.text);
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/features/auth/presentation/screen/signin.dart';
import 'package:r2ait_app/features/auth/presentation/widget/custom_text_from_email.dart';
import 'package:r2ait_app/features/auth/presentation/widget/custom_text_from_password.dart';

import '../../../../core/constants/controller_control/signup_controller.dart';
import '../../../../core/constants/fontsize_control/widget_support.dart';
import '../../logic/register_controller.dart';
import '../widget/custombuttom.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  SignUpController signUpController = Get.put(SignUpController());
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create An\n Account",
                  style: AppWidget.hederTextFeildStyle(),
                ),
                SizedBox(height: screenheight * 0.02),

                CustomTextFromEmail(
                  controller: signUpController.nameController,
                  hintText: "Name",
                  icon: Icons.man,
                ),
                SizedBox(height: screenheight * 0.02),
                CustomTextFromEmail(
                  controller: signUpController.usernameController,
                  hintText: "User Name",
                  icon: Icons.person,
                ),

                SizedBox(height: screenheight * 0.02),

                CustomTextFromEmail(
                  controller: signUpController.emailController,
                  hintText: "Email",
                  icon: Icons.email,
                ),

                SizedBox(height: screenheight * 0.02),

                CustomTextFromPassword(
                  controller: signUpController.passwordController,
                  obscureText: signUpController.obscurePassword,
                  hintText: "Password",
                ),
                SizedBox(height: screenheight * 0.03),

                /// Sign Up Button
                CustomButton(
                  buttonText: "Sign Up",
                  color: const Color.fromARGB(255, 4, 56, 5),
                  onPressed: () {
                    gotoSignin();
                    // Get.to(() => gotoSignin());
                  },
                  textColor: Colors.white,
                ),
                SizedBox(height: screenheight * 0.04),

                /// Divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(width: 95, height: 4, color: Colors.grey),
                    Text("Or continue with",
                        style: AppWidget.appBarTextFeildStyle()),
                    Container(width: 95, height: 4, color: Colors.grey),
                  ],
                ),
                SizedBox(height: screenheight * 0.04),

                /// Google Button
                InkWell(
                  onTap: () {
                    // Google sign-in logic
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 2, color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/google.png",
                            height: 30, width: 30, fit: BoxFit.cover),
                        SizedBox(width: 8),
                        Text("Continue with Google",
                            style: AppWidget.appBarTextFeildStyle()),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenheight * 0.04),

                /// Already have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account?",
                        style: AppWidget.appBarTextFeildStyle()),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        Get.to(Signin());
                      },
                      child: Text('Sign In!',
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

  void gotoSignin() {
    if (_formKey.currentState!.validate()) {
      RegisterController.signUp(
          firstName: signUpController.nameController.text.trim(),
          email: signUpController.emailController.text.trim(),
          password: signUpController.passwordController.text,
          username: signUpController.usernameController.text.trim());
    } else {}
  }
}

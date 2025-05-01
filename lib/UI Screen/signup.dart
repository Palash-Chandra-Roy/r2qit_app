import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/App%20Fontsize/widget_support.dart';
import 'package:r2ait_app/Controller/signup_controller.dart';
import 'package:r2ait_app/Coustom_Widget/custombuttom.dart';
import 'package:r2ait_app/UI%20Screen/signin.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  SignUpController signUpController = Get.put(SignUpController());
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();

  void gotoSignin() {
    if (_formKey.currentState!.validate()) {
      print("✅ Form Validated - Navigating to Signin Page");
      Get.to(Signin());
    } else {
      print("❌ Form Not Valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create An\n Account",
                  style: AppWidget.hederTextFeildStyle(),
                ),
                SizedBox(height: screenheight * 0.03),

                /// Full Name
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                  controller: signUpController.nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenheight * 0.02),
                //Email
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: signUpController.emailController,
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
                SizedBox(height: screenheight * 0.02),
                //password
                TextFormField(
                  controller: signUpController.passwordController,
                  obscureText: obscureText,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: screenheight * 0.04),

                /// Sign Up Button
                CustomButton(
                  buttonText: "Sign Up",
                  color: const Color.fromARGB(255, 4, 56, 5),
                  onPressed: gotoSignin,
                  // () {
                  //   Get.to(Signin());
                  // },
                  textColor: Colors.white,
                ),
                SizedBox(height: screenheight * 0.04),

                /// Divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 100, height: 4, color: Colors.grey),
                    Text("Or continue with",
                        style: AppWidget.appBarTextFeildStyle()),
                    Container(width: 100, height: 4, color: Colors.grey),
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
}

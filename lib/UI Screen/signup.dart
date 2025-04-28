import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/Coustom_Widget/custombuttom.dart';
import 'package:r2ait_app/Coustom_Widget/customtextfromfield.dart';
import 'package:r2ait_app/UI%20Screen/otp.dart';
import 'package:r2ait_app/UI%20Screen/signin.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    bool isCheck = false;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
            "Back",
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Create An\n Accout ",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      hintText: "Email",
                      autocorrect: false,
                      //fillColor: Colors.white70,
                      prefixIcon: Icon(Icons.email),
                      filled: true,
                      keyboardType: TextInputType.visiblePassword,
                      //keyboardType: TextInputType.number,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Last Name";
                      //   } else {
                      //     return null!;
                      //   }
                      // },
                    ),
                    SizedBox(
                      height: screenheight * 0.01,
                    ),
                    CustomTextFormField(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      keyboardType: TextInputType.visiblePassword,
                      // More appropriate for password input
                      obscureText: true, // Usually true for password fields
                      suffixIcon: Icon(Icons.visibility_off),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Password is required"; // Meaningful error message
                      //   }
                      //   if (value.length < 6) {
                      //     return "Password must be at least 6 characters long"; // Basic validation
                      //   }
                      //   return null!; // Valid input
                      // },
                    ),
                    SizedBox(
                      height: screenheight * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: isCheck,
                            onChanged: (bool? newVal) {
                              setState(() {
                                isCheck = newVal!;
                              });
                              Text(isCheck ? "Check" : "UnCheck");
                            }),
                        Flexible(
                          child: Text(
                            "Remember me",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenheight * 0.01,
                    ),
                    CustomButton(
                        buttonText: "Sign Up",
                        color: Color(0xFFA020F0),
                        onPressed: () {},
                        textColor: Colors.black),
                    SizedBox(
                      height: screenheight * 0.03,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Get.to(OTP());
                          // Get.to(ForgetPassword());
                        },
                        child: Text(
                          "Forgot the Password?",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFA020F0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenheight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 120, height: 4, color: Colors.grey),
                        Text(
                          "Or continue with",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Container(width: 120, height: 4, color: Colors.grey),
                      ],
                    ),
                    SizedBox(
                      height: screenheight * 0.04,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 60,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(width: 2, color: Colors.grey),
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage("assets/images/facebook.png"),
                                ),
                              )),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                              height: 60,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(width: 2, color: Colors.grey),
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage("assets/images/google.png"),
                                ),
                              )),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                              height: 60,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(width: 2, color: Colors.grey),
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage("assets/images/apple.png"),
                                ),
                              )),
                        ]),
                    SizedBox(
                      height: screenheight * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Account?",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF0F172A)),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(LoginScreen());
                          },
                          child: Text(
                            'Sing In!',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF7E22CD),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ])),
        ));
  }
}

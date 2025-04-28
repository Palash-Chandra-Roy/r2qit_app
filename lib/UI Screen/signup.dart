// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:r2ait_app/App%20Fontsize/widget_support.dart';
// import 'package:r2ait_app/Coustom_Widget/custombuttom.dart';
// import 'package:r2ait_app/Coustom_Widget/customtextfromfield.dart';
// import 'package:r2ait_app/UI%20Screen/otp.dart';
// import 'package:r2ait_app/UI%20Screen/signin.dart';

// class signupScreen extends StatefulWidget {
//   const signupScreen({super.key});

//   @override
//   State<signupScreen> createState() => _signupScreenState();
// }

// class _signupScreenState extends State<signupScreen> {
//   bool isCheck = false; // Remember me checkbox
//   bool obscureText = true; // Toggle for password visibility
//   final _formKey = GlobalKey<FormState>(); // GlobalKey for form validation

//   @override
//   Widget build(BuildContext context) {
//     double screenheight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: 100, left: 20, right: 20),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Create An\n Account",
//                   style: AppWidget.hederTextFeildStyle(),
//                 ),
//                 SizedBox(height: 20),
//                 CustomTextFormField(
//                   hintText: "Email",
//                   autocorrect: false,
//                   prefixIcon: Icon(Icons.email),
//                   filled: true,
//                   keyboardType: TextInputType.emailAddress,
//                   // validator: (value) {
//                   //   if (value == null || value.isEmpty) {
//                   //     return "Email is required";
//                   //   }
//                   //   if (!RegExp(
//                   //           r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
//                   //       .hasMatch(value)) {
//                   //     return "Please enter a valid email";
//                   //   }
//                   //   return null!;
//                   // },
//                 ),
//                 SizedBox(height: screenheight * 0.01),
//                 CustomTextFormField(
//                   hintText: "Password",
//                   prefixIcon: Icon(Icons.lock),
//                   filled: true,
//                   obscureText: obscureText, // Toggle password visibility
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                         obscureText ? Icons.visibility_off : Icons.visibility),
//                     onPressed: () {
//                       setState(() {
//                         obscureText = !obscureText;
//                       });
//                     },
//                   ),
//                   // validator: (value) {
//                   //   if (value == null || value.isEmpty) {
//                   //     return "Password is required";
//                   //   }
//                   //   if (value.length < 6) {
//                   //     return "Password must be at least 6 characters long";
//                   //   }
//                   //   return null!;
//                   // },
//                 ),
//                 SizedBox(height: screenheight * 0.04),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Checkbox(
//                       value: isCheck,
//                       onChanged: (bool? newVal) {
//                         setState(() {
//                           isCheck = newVal!;
//                         });
//                       },
//                     ),
//                     Flexible(
//                       child: Text(
//                         "Remember me",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: screenheight * 0.01),
//                 CustomButton(
//                   buttonText: "Sign Up",
//                   color: Color(0xFFA020F0),
//                   onPressed: () {
//                     if (_formKey.currentState?.validate() ?? false) {
//                       // If the form is valid, navigate to OTP screen
//                       Get.to(OTP());
//                     }
//                   },
//                   textColor: Colors.black,
//                 ),
//                 SizedBox(height: screenheight * 0.03),
//                 Center(
//                   child: InkWell(
//                     onTap: () {
//                       Get.to(OTP());
//                     },
//                     child: Text("Forgot the Password?",
//                         style: AppWidget.simpleTextFeildStyle()),
//                   ),
//                 ),
//                 SizedBox(height: screenheight * 0.03),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(width: 120, height: 4, color: Colors.grey),
//                     Text("Or continue with",
//                         style: AppWidget.appBarTextFeildStyle()),
//                     Container(width: 120, height: 4, color: Colors.grey),
//                   ],
//                 ),
//                 SizedBox(height: screenheight * 0.04),
//                 InkWell(
//                   onTap: () {
//                     // Implement Google sign-in functionality if needed
//                   },
//                   child: Container(
//                     height: 60,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(width: 2, color: Colors.grey),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset("assets/images/google.png",
//                             height: 30, width: 30, fit: BoxFit.cover),
//                         SizedBox(width: 5),
//                         Text("Continue with Google",
//                             style: AppWidget.appBarTextFeildStyle()),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenheight * 0.04),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Already have an Account?",
//                         style: AppWidget.appBarTextFeildStyle()),
//                     SizedBox(width: 8),
//                     InkWell(
//                       onTap: () {
//                         Get.to(LoginScreen());
//                       },
//                       child: Text('Sign In!',
//                           style: AppWidget.parpleTextFeildStyle()),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/App%20Fontsize/widget_support.dart';
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
  bool isCheck = false; // Remember me checkbox
  bool obscureText = true; // Toggle for password visibility
  final _formKey = GlobalKey<FormState>(); // GlobalKey for form validation

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create An\n Account",
                  style: AppWidget.hederTextFeildStyle(),
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  hintText: "Email",
                  autocorrect: false,
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                        .hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null!;
                  },
                ),
                SizedBox(height: screenheight * 0.01),
                CustomTextFormField(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  obscureText: obscureText, // Toggle password visibility
                  suffixIcon: IconButton(
                    icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters long";
                    }
                    return null!;
                  },
                ),
                SizedBox(height: screenheight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isCheck,
                      onChanged: (bool? newVal) {
                        setState(() {
                          isCheck = newVal!;
                        });
                      },
                    ),
                    Flexible(
                      child: Text(
                        "Remember me",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenheight * 0.01),
                CustomButton(
                  buttonText: "Sign Up",
                  color: Color(0xFFA020F0),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // If the form is valid, navigate to OTP screen
                      Get.to(OTP());
                    }
                  },
                  textColor: Colors.black,
                ),
                SizedBox(height: screenheight * 0.03),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.to(OTP());
                    },
                    child: Text("Forgot the Password?",
                        style: AppWidget.simpleTextFeildStyle()),
                  ),
                ),
                SizedBox(height: screenheight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 120, height: 4, color: Colors.grey),
                    Text("Or continue with",
                        style: AppWidget.appBarTextFeildStyle()),
                    Container(width: 120, height: 4, color: Colors.grey),
                  ],
                ),
                SizedBox(height: screenheight * 0.04),
                InkWell(
                  onTap: () {
                    // Implement Google sign-in functionality if needed
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 2, color: Colors.grey),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/google.png",
                            height: 30, width: 30, fit: BoxFit.cover),
                        SizedBox(width: 5),
                        Text("Continue with Google",
                            style: AppWidget.appBarTextFeildStyle()),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenheight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account?",
                        style: AppWidget.appBarTextFeildStyle()),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        Get.to(LoginScreen());
                      },
                      child: Text('Sign In!',
                          style: AppWidget.parpleTextFeildStyle()),
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

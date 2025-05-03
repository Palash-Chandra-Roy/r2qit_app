//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     final OAuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     // Sign in to Firebase
//     await _auth.signInWithCredential(credential);

//     // After successful sign-in, you can navigate to your home screen or another screen
//     print("User Signed In: ${_auth.currentUser?.displayName}");
//     // Example: Navigate to HomeScreen
//     // Get.to(HomeScreen());
//   } catch (e) {
//     print("Error during Google Sign-In: $e");
//     Get.snackbar("Error", "Google Sign-In failed");
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/features/auth/presentation/screen/otp.dart';
import 'package:r2ait_app/features/auth/presentation/screen/signup.dart';

import '../../../../core/constants/Controller/signin_controller.dart';
import '../../../../core/constants/fontsize_control/widget_support.dart';
import '../../../../widgets/bottom_navbar.dart';
import '../widget/custombuttom.dart'; // Add this import if missing

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  SigninController signinController = Get.put(SigninController());
  bool isCheck = false;
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  height: 200,
                  "assets/images/logo.png",
                ),

                Text("Sign In", style: AppWidget.hederTextFeildStyle()),
                SizedBox(height: screenheight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 90,
                        height: 4,
                        color: const Color.fromARGB(255, 4, 56, 5)),
                    SizedBox(width: 5),
                    Container(width: 90, height: 4, color: Colors.red),
                  ],
                ),
                SizedBox(height: screenheight * 0.03),

                // Email
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: signinController.emailController,
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
                  controller: signinController.passwordController,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters long";
                    }
                    return null;
                  },
                ),

                SizedBox(height: screenheight * 0.01),
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
                InkWell(
                  onTap: () {
                    // signInWithGoogle(); // Uncomment and implement if needed
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
                            height: 30, width: 30),
                        SizedBox(width: 5),
                        Text("Continue with Google",
                            style: AppWidget.appBarTextFeildStyle()),
                      ],
                    ),
                  ),
                ),
                // Divider

                SizedBox(height: screenheight * 0.02),
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
                        style: AppWidget.appBarTextFeildStyle(),
                      ),
                    ),
                  ],
                ),
                // Sign In Button

                SizedBox(height: screenheight * 0.02),
                CustomButton(
                  buttonText: "Sign In",
                  color: const Color.fromARGB(255, 4, 56, 5),
                  onPressed: gotoHome,
                  textColor: Colors.white,
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

  void gotoHome() {
    if (_formKey.currentState?.validate() ?? false) {
      if (!isCheck) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Tick this checkbox")),
        );
        return;
      }
      print("✅ Form Validated - Navigating to Home Page");
      Get.to(BottomNavbar());
    }
  }
}

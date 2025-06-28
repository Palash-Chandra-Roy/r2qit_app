import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:r2ait_app/features/auth/logic/login_controller.dart';
import 'package:r2ait_app/features/auth/presentation/screen/google.dart';
import 'package:r2ait_app/features/auth/presentation/screen/otp.dart';
import 'package:r2ait_app/features/auth/presentation/screen/signup.dart';
import 'package:r2ait_app/features/home/presentation/screen/home.dart';
import '../../logic/signin_controller.dart';
import '../../../../core/constants/fontsize_control/widget_support.dart';
import '../../../../widget/custom_logo.dart';
import '../widget/custom_sign_text.dart';
import '../widget/custombuttom.dart';
import '../widget/logo_and_text.dart';
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
    final size = MediaQuery.of(context).size;
    double height =size.height;
    double width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               LogoAndText(),
                // Email and password, forgot
                PasswordField(),
                // Google Sign In (optional)
                InkWell(
                  onTap: () {
                    googleLogin();
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

                SizedBox(height: height * 0.02),

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

                SizedBox(height: height * 0.02),

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

                    // Go to home screen
                    // gotoHome(email: email, password: password);
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
  void googleLogin()async {

    final user =await AuthServiceGoogle().signInWithGoogle();
    if (user != null){
      Logger().e(user.additionalUserInfo);
      Get.offAll(Home());
    }

    }
}
class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    SigninController signinController = Get.put(SigninController());
    final size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    bool obscureText = true;
    return Column(
      children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: "Email Or username",
            prefixIcon: Icon(Icons.email),
          ),
          keyboardType: TextInputType.emailAddress,
          controller: signinController.userOrEmailController,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "Email Or username is required";
            } else if (!RegExp(
                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                .hasMatch(value) &&
                !RegExp(r'^[a-zA-Z0-9_]{3,20}$').hasMatch(value)) {
              return "Please enter a valid email Or username";
            } else {
              return null;
            }
          },
        ),
        SizedBox(height: height * 0.02),
        //password
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
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

        SizedBox(height: height * 0.01),
      ],
    );
  }
}


class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.max,
      children: [

        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            hintText: "Email or Username"
          ),
        ),
        SizedBox(height: 15.w,),
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              hintText: "Password"

          ),
        ),
        SizedBox(height: 10.w,),
        InkWell(
          onTap: () {
          },
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text("Forgot Password?",style: TextStyle(color: Colors.blue),
            )
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/features/auth/presentation/screen/signin.dart';

import '../../../../core/constants/Controller/forget_controller.dart';
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("assets/images/forgot.png"),
                  ),
                ),
                SizedBox(height: screenheight * 0.02),
                Text("Create Your New Password",
                    style: AppWidget.appBarTextFeildStyle()),
                SizedBox(height: screenheight * 0.03),
                TextFormField(
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText: " New Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  controller: forgetController.newPasswordController,
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
                SizedBox(height: screenheight * 0.02),
                TextFormField(
                  obscureText: obscuresText,
                  decoration: InputDecoration(
                    hintText: " Confirm Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(obscuresText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          obscuresText = !obscuresText;
                        });
                      },
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  controller: forgetController.confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm password is required";
                    }
                    if (value.length < 6) {
                      return "Confirm password must be at least 6 characters long";
                    }
                    return null;
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
                          isCheck = newVal ?? false;
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
                SizedBox(height: screenheight * 0.06),
                CustomButton(
                  buttonText: "Continue",
                  color: const Color.fromARGB(255, 4, 56, 5),
                  textColor: Colors.white,
                  onPressed: gotoSigninpage,
                ),
                SizedBox(height: screenheight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void gotoSigninpage() {
    if (_formKey.currentState?.validate() ?? false) {
      if (forgetController.newPasswordController.text !=
          forgetController.confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            "Passwords do not match",
            style: TextStyle(color: Colors.red),
          )),
        );
        return;
      }
      if (!isCheck) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Tick this checkbox")),
        );
        return;
      }

      Get.to(() => const Signin());
    }
  }
}

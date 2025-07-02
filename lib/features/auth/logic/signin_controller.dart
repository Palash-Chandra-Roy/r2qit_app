import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/widgets/bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SigninController extends GetxController {
  final userOrEmailController = TextEditingController();
  final passwordController = TextEditingController();
  var isCheck = false.obs;
  final obscurePassword = true.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    loadSavedCredentials();
  }

  void loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email') ?? '';
    final savedPassword = prefs.getString('password') ?? '';

    userOrEmailController.text = savedEmail;
    passwordController.text = savedPassword;
    isCheck.value = savedEmail.isNotEmpty && savedPassword.isNotEmpty;
  }

  void handleSignIn() async {
    final prefs = await SharedPreferences.getInstance();

    if (formKey.currentState?.validate() ?? false) {
      if (isCheck.value) {
        await prefs.setString("email", userOrEmailController.text);
        await prefs.setString("password", passwordController.text);
        print("✅ Credentials remembered");
      } else {
        await prefs.remove("email");
        await prefs.remove("password");
        print("🚫 Not remembering credentials");
      }

      // Navigate to Home
      Get.to(() => BottomNavbar());
    }
  }
}

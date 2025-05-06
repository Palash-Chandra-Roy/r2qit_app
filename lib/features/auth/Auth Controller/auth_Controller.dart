import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  // Logout Function
  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed('/login'); // Replaces entire navigation stack
  }

  // Simulated login for demo
  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);
    Get.offAllNamed('/home'); // Replaces stack, user can't go back to login
  }
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:r2ait_app/core/constants/api_control/auth_api.dart';
import 'package:r2ait_app/widgets/bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/headers.dart';

class LoginController {
  // static void goToDashboard(String role) {
  //   switch (role) {
  //     case 'user':
  //       Get.to(() => BottomNavbar());
  //       break;
  //     case 'admin':
  //       Get.to(() => AdminScreen());
  //       break;
  //     default:
  //       Get.snackbar("Error", "Unknown role: $role");
  //   }
  // }

  static Future<void> login({
    required String user_or_email,
    required String password,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final Map<String, String> body = {
        'user_or_mail': user_or_email,
        'password': password,
      };
      Uri url = Uri.parse(AuthAPIController.userLogin);
      final http.Response res = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body), // note: using jsonEncode for JSON body
      );
      Logger().e("Login response: ${res.body}");

      final jsondata = jsonDecode(res.body);
      if (res.statusCode == 200) {
        await prefs.setString('token', jsondata['access']);
        await prefs.setString('id', jsondata['id']);
        await prefs.setString('role', jsondata['role']);
        Get.to(() => BottomNavbar());
      } else if (res.statusCode == 404) {
        Get.snackbar("Login Failed", "User not found");
      } else if (res.statusCode == 403) {
        Get.snackbar("Access Denied", "Invalid credentials");
      } else {
        Get.snackbar("Error", "Your email and password are incorrect.");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }
}

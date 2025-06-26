import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:r2ait_app/core/constants/api_control/auth_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/toast_controler.dart';
import '../data/headers.dart';
import '../presentation/screen/signin.dart';

class RegisterController {
  static void signUp({
    String? firstName,
    required String email,
    required String password,
    required String username,
  }) async {
    SharedPreferences profs = await SharedPreferences.getInstance();
    Map body = {
      'firstName': firstName,
      'email': email,
      'password': password,
      "username": username,
      'role': 'user'
    };

    Uri url = Uri.parse(AuthAPIController.userSignUp);

    final http.Response res = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body), // note: using jsonEncode for JSON body
    );
    var decode = jsonDecode(res.body);
    if (res.statusCode == 201) {
      Get.to(() => Signin());
      flutterToast(decode['message']);
    } else if (res.statusCode == 409) {
      Get.snackbar("Sign Up Failed", "Already Have an account");
    } else if (res.statusCode == 403) {
      Get.snackbar("Access Denied", "Invalid credentials");
    } else {
      Get.snackbar("Error", "Unexpected error occurred");
    }
  }
}

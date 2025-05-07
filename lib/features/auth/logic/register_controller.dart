import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:r2ait_app/core/constants/api_control/auth_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/toast_controler.dart';
import '../presentation/screen/signin.dart';

class RegisterController {
  static void signUp({
    String? name,
    required String email,
    required String password,
    required String username,
  }) async {
    SharedPreferences profs = await SharedPreferences.getInstance();
    var url = Uri.parse('${AuthAPIController.userSignUp}');
    Logger().e("done : ${url}");
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    Map body = {
      'name': name,
      'email': email,
      'password': password,
      "username": username,
      'role': 'user'
    };
    final http.Response res = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body), // note: using jsonEncode for JSON body
    );
    Logger().e(res.body);
    Logger().e(res.statusCode);
    var decode = jsonDecode(res.body);
    if (res.statusCode == 201) {
      Get.to(() => Signin());
      flutterToast(decode['message']);
    } else if (res.statusCode == 404) {}
  }
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:r2ait_app/core/constants/api_control/auth_api.dart';
import 'package:r2ait_app/features/auth/data/headers.dart';

class UsernameController extends GetxController {
  var username = ''.obs;
  var errorText = RxnString(); // null হতে পারে
  void onUsernameChanged(String value) {
    username.value = value;
    if (value.isNotEmpty) {
      checkUsername(value);
    } else {
      errorText.value = "Username is required";
    }
  }

  Future<void> checkUsername(String value) async {
    final url = Uri.parse(AuthAPIController.allUsers);
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({'username': value}),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      if (result['valid'] == true) {
        errorText.value = null; // Valid
      } else {
        errorText.value = result['message'] ?? "Invalid username";
      }
    } else {
      errorText.value = "Server error";
    }
  }
}

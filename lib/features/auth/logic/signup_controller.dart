import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerwithEmail() async {
    // try {
    //   var headers = {"Content-type": "application/jeson"};
    //   var url = Uri.parse(
    //       ApiEndpoint.baseUrl + ApiEndpoint.authEndPoints.registerEmail);
    //   Map body = {
    //     'name': nameController.text,
    //     'email': emailController.text.trim(),
    //     'password': passwordController.text.trim()
    //   };

    //   http.Response response =
    //       await http.post(url, body: jsonEncode(body), headers: headers);

    //   if (response.statusCode == 200) {
    //     final json = jsonDecode(response.body);
    //     if (json['code'] == 0) {
    //       var token = json['data']['Token'];
    //       print(token);
    //       final SharedPreferences? prefs = await _prefs;

    //       await prefs?.setString('token', token);
    //       nameController.clear();
    //       emailController.clear();
    //       passwordController.clear();
    //     } else {
    //       throw jsonDecode(response.body)["message"] ?? "unknown Error Occurd";
    //     }
    //   }
    // } catch (e) {
    //   Get.back();
    //   showDialog(
    //       context: Get.context!,
    //       builder: (context) {
    //         return SimpleDialog(
    //           title: Text("Error"),
    //           contentPadding: EdgeInsets.all(20),
    //           children: [Text(e.toString())],
    //         );
    //       });
    // }
  }
}

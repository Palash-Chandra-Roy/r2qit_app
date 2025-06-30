import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/bottom_navbar.dart';
import '../../auth/presentation/screen/signin.dart';

class CheckLoginStatus{
  Future<void> checkLoginStatus() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? id = _prefs.getString("id");
    if (id != null && id.isNotEmpty) {
      Get.to(() => BottomNavbar());
    } else {
      Get.to(() => Signin());
    }
  }
}
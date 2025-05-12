import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceControl extends GetxController {
  late bool isAdmin = false;
  bool isLoading = false;
  Future<bool> checkAdmin() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    update();
    isLoading = true;
    String role = _prefs.getString("role").toString();
    if (role == "admin") {
      return isAdmin = true;
    }
    return isAdmin = false;
  }
}

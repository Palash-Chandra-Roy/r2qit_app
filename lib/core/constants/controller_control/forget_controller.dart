import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgetController extends GetxController {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var obscureNewPassword = true.obs;
  var obscureConfirmPassword = true.obs;
}

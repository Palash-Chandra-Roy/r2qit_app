import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/dark_theme.dart';
import '../../../theme/light_theme.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  ThemeData get currentTheme => isDarkMode.value ? darkMode : lightMode;
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../theme/dark_theme.dart';
import '../../../theme/light_theme.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;
  void toggleTheme() {
    Logger().d("toggleTheme");
    isDarkMode.value = !isDarkMode.value;
  }

  ThemeData get currentTheme => isDarkMode.value ? darkMode : lightMode;
}

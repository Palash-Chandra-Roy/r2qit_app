import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/theme/dark_theme.dart';
import 'package:r2ait_app/theme/light_theme.dart';

class ThemeChanger extends GetxController {
  RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    update();
  }

  ThemeData get themeMode => !isDarkMode.value ? lightMode : darkMode;
}

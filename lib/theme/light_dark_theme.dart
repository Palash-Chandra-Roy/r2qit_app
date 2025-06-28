import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:r2ait_app/theme/input_decoration_theme.dart';
import '../core/constants/color_control/theme_color_controller.dart';
import 'logic/theme_changer.dart';
final ThemeChanger _themeController = Get.put(ThemeChanger());
ThemeData themeMood(){
  Brightness brightness = _themeController.isDarkMode.value? Brightness.light : Brightness.dark;
  return ThemeData(
  brightness:brightness,
  colorScheme: ColorScheme.light(
    brightness: brightness,
      primary: ThemeColorController.green,
      onPrimary:_themeController.isDarkMode.value?  ThemeColorController.white :ThemeColorController.black,
      secondary:ThemeColorController.green,
      onSecondary:_themeController.isDarkMode.value? ThemeColorController.white:ThemeColorController.black,
      surface:  ThemeColorController.grey,
      onSurface:_themeController.isDarkMode.value? ThemeColorController.black:ThemeColorController.white),
// inputDecorationTheme: lightInputDecorationTheme,
  useMaterial3: true,
  // scaffoldBackgroundColor: _themeController.isDarkMode.value? ColorController.white,

);
}
import 'package:get/get.dart';
import 'package:r2ait_app/theme/dark_theme.dart';
import 'package:r2ait_app/theme/light_theme.dart';

class ThemeChanger extends GetxController {
  var themeMode = lightMode;
  void _toggleTheme() {
    themeMode = themeMode == lightMode ? darkMode : lightMode;
    update();
  }
}

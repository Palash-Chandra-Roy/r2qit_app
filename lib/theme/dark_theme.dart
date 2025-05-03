import 'package:flutter/material.dart';
import 'package:r2ait_app/theme/text_field_theme.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
  useMaterial3: true,
  inputDecorationTheme: darkInputDecorationTheme,
);

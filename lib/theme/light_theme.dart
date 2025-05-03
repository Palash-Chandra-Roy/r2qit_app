import 'package:flutter/material.dart';
import 'package:r2ait_app/theme/text_field_theme.dart' as SharedTheme;

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  inputDecorationTheme: SharedTheme.lightInputDecorationTheme,
);

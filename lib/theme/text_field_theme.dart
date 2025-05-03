import 'package:flutter/material.dart';

InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  filled: true,
  prefixIconColor: Colors.grey,
  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(12),
  ),
);
InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.grey,
  prefixIconColor: Colors.white,
  hintStyle: TextStyle(color: Colors.white, fontSize: 14),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(12),
  ),
);

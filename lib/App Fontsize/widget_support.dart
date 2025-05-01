import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle appBarTextFeildStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle greyTextFeildStyle() {
    return TextStyle(
      color: Color(0xFF5C5C5C),
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle brand1TextFeildStyle() {
    return TextStyle(
      color: const Color.fromARGB(255, 4, 56, 5),
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle hederTextFeildStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle simpleTextFeildStyle() {
    return TextStyle(color: Colors.blue, fontSize: 14);
  }

  static TextStyle whiteTextFeildStyle() {
    return TextStyle(color: Colors.white, fontSize: 18);
  }

  //
  static TextStyle boldWhiteTextFeildStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle boldTextFeildStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle priceTextFeildStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle signUpTextFeildStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }
}

import 'package:flutter/material.dart';

class SizeConfig {
  static bool isVerySmall(BuildContext context) {
    return MediaQuery.of(context).size.height <= 360;
  }

  static bool isSmall(BuildContext context) {
    return MediaQuery.of(context).size.height <= 580;
  }

  static bool isVerySmallWidth(BuildContext context) {
    return MediaQuery.of(context).size.width >= 320 &&
        MediaQuery.of(context).size.width <= 480;
  }

  static bool isSmallWidth(BuildContext context) {
    return MediaQuery.of(context).size.width >= 481 &&
        MediaQuery.of(context).size.width <= 767;
  }

  static bool isTabletHeight(BuildContext context) {
    return MediaQuery.of(context).size.height >= 800;
  }

  static bool isSmallHeight(BuildContext context) {
    return MediaQuery.of(context).size.height >= 480 &&
        MediaQuery.of(context).size.height <= 885;
  }

  static bool isTabletWidth(BuildContext context) {
    return MediaQuery.of(context).size.width >= 768 &&
        MediaQuery.of(context).size.width <= 1024;
  }
}

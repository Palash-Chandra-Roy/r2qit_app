import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/core/constants/fontsize_control/widget_support.dart';

class CustomAppBar {
  static PreferredSizeWidget build({
    required String title,
    bool centerTitle = true,
    bool showBackButton = true,
    Color backgroundColor = Colors.white,
    Color iconColor = Colors.black,
    double iconSize = 14,
    TextStyle? titleTextStyle,
    VoidCallback? onBackPressed,
    List<Widget>? actions,
  }) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: showBackButton
          ? IconButton(
              onPressed: onBackPressed ?? () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios,
                size: iconSize,
                color: iconColor,
              ),
            )
          : null,
      title: Text(
        title,
        style: titleTextStyle ?? AppWidget.appBarTextFeildStyle(),
      ),
      actions: actions,
    );
  }
}

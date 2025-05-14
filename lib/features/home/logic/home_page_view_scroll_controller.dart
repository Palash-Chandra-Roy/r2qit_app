import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/core/constants/image_controller/image_controller.dart';

class PageViwerScrollController extends GetxController {
  var bannerPageController = PageController();

  var currentBannerPage = 0.obs;
  Timer? _autoScrollTimer;

  @override
  void onInit() {
    super.onInit();
    bannerPageController.dispose();
    bannerPageController = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    _autoScrollTimer?.cancel();
    _startAutoScrollBanner();
    super.onClose();
  }

  void _startAutoScrollBanner() {
    _autoScrollTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (bannerPageController.hasClients) {
        int nextPage = bannerPageController.page!.round() + 1;
        if (nextPage >= ImageController.bannerImages.length) {
          nextPage = 0;
        }
        bannerPageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}

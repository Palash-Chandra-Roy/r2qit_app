import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Page and scroll controllers
  var bannerPageController = PageController();
  var categoryScrollController = ScrollController();
  var resetProjectController = ScrollController();
  var baseProjectController = ScrollController();
  var teamController = ScrollController();

  var teamPageController = PageController(viewportFraction: 0.5);

  // Observables
  var currentTeamPage = 0.obs;
  var selectedCategoryIndex = 0.obs;
  var currentBannerPage = 0.obs;
  var currentPage = 0.obs;

  RxBool isCategoryAtStart = true.obs;
  RxBool isCategoryAtEnd = false.obs;
  RxBool isProjectAtStart = true.obs;
  RxBool isProjectAtEnd = false.obs;
  RxBool isBestProjectAtStart = true.obs;
  RxBool isBestProjectAtEnd = false.obs;
  RxBool isTeamStart = true.obs;
  RxBool isTeamEnd = false.obs;

  Timer? _autoScrollTimer;

  @override
  void onInit() {
    super.onInit();

    teamController.addListener(_updateScrollButtonState);

    bannerPageController = PageController(initialPage: 0);
    _startAutoScrollBanner();

    categoryScrollController.addListener(() {
      final max = categoryScrollController.position.maxScrollExtent;
      final current = categoryScrollController.offset;
      isCategoryAtStart.value = current <= 0;
      isCategoryAtEnd.value = current >= max;
    });

    resetProjectController.addListener(() {
      final max = resetProjectController.position.maxScrollExtent;
      final current = resetProjectController.offset;
      isProjectAtStart.value = current <= 0;
      isProjectAtEnd.value = current >= max;
    });

    baseProjectController.addListener(() {
      final max = baseProjectController.position.maxScrollExtent;
      final current = baseProjectController.offset;
      isBestProjectAtStart.value = current <= 0;
      isBestProjectAtEnd.value = current >= max;
    });
  }

  @override
  void onClose() {
    _autoScrollTimer?.cancel();
    bannerPageController.dispose();
    categoryScrollController.dispose();
    resetProjectController.dispose();
    baseProjectController.dispose();
    teamController.dispose();
    super.onClose();
  }

  void _startAutoScrollBanner() {
    _autoScrollTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (bannerPageController.hasClients) {
        int nextPage = bannerPageController.page!.round() + 1;
        if (nextPage >= bannerImages.length) {
          nextPage = 0;
        }
        bannerPageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 10),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _updateScrollButtonState() {
    isTeamStart.value =
        teamController.offset <= teamController.position.minScrollExtent + 10;
    isTeamEnd.value =
        teamController.offset >= teamController.position.maxScrollExtent - 10;
  }

  // Dynamic item list management
  var items = List.generate(10, (index) => "Item $index").obs;
  void addItem() {
    items.add("Item ${items.length}");
  }

  void removeItem(int index) {
    if (items.isNotEmpty) {
      items.removeAt(index);
    }
  }

  void updateSelectedIndex(int index) {
    selectedCategoryIndex.value = index;
  }

  // Static banner images
  List<String> bannerImages = [
    'assets/images/banner.png',
    'assets/images/banner1.png',
    'assets/images/banner.png',
  ].obs;

  // Static service categories
  List<ServiceCategory> serviceCategories = <ServiceCategory>[
    ServiceCategory(
        image: "assets/images/grapic_design.png", name: "GRAPHIC DESIGN"),
    ServiceCategory(image: "assets/images/webflow.jpeg", name: "WEBFLOW"),
    ServiceCategory(
        image: "assets/images/gohighlevel.png", name: "GOHIGHLEVEL"),
    ServiceCategory(image: "assets/images/reactjs.jpeg", name: "REACT JS"),
    ServiceCategory(image: "assets/images/wowrdpress.png", name: "WORDPRESS"),
    ServiceCategory(image: "assets/images/shopify.png", name: "SHOPIFY"),
    ServiceCategory(image: "assets/images/ios.jpeg", name: "App Development"),
    ServiceCategory(image: "assets/images/sdlc.jpg", name: "SOFTWARE DESIGN"),
    ServiceCategory(image: "assets/images/js.png", name: "JS"),
  ].obs;
}

class ServiceCategory {
  final String image;
  final String name;

  ServiceCategory({
    required this.image,
    required this.name,
  });
}

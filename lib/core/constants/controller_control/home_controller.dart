import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var bannerPageController = PageController();
  var categoryScrollController = ScrollController();
  var resetProjectController = ScrollController();
  var baseProjectController = ScrollController();
  var teamController = ScrollController();

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

    _startAutoScrollBanner();

    // Scroll listener for category list
    categoryScrollController.addListener(() {
      final max = categoryScrollController.position.maxScrollExtent;
      final current = categoryScrollController.offset;
      isCategoryAtStart.value = current <= 0;
      isCategoryAtEnd.value = current >= max;
    });

    // Scroll listener for recent project list
    resetProjectController.addListener(() {
      final max = resetProjectController.position.maxScrollExtent;
      final current = resetProjectController.offset;
      isProjectAtStart.value = current <= 0;
      isProjectAtEnd.value = current >= max;
    });

    //BestProject
    baseProjectController.addListener(() {
      final max = baseProjectController.position.maxScrollExtent;
      final current = baseProjectController.offset;
      isBestProjectAtStart.value = current <= 0;
      isBestProjectAtEnd.value = current >= max;
    });

    teamController.addListener(() {
      final max = teamController.position.maxScrollExtent;
      final current = teamController.offset;
      isTeamStart.value = current <= 0;
      isTeamEnd.value = current >= max;
    });
  }

  void _startAutoScrollBanner() {
    _autoScrollTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (bannerPageController.hasClients) {
        int nextPage = currentBannerPage.value + 1;
        if (nextPage >= bannerImages.length) {
          nextPage = 0;
        }
        bannerPageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
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

//End
  // List of Generate addItem & Remove Item ;
  var items = List.generate(10, (index) => "Item $index").obs;
  void addItem() {
    int nextIndex = items.length;
    items.add("Item $nextIndex");
  }

  void removeItem(int index) {
    if (items.isNotEmpty) {
      items.removeAt(index);
    }
  }

  void updateSelectedIndex(int index) {
    selectedCategoryIndex.value = index;
  }

  // List of Service Categories//
  List serviceCategories = <ServiceCategory>[
    ServiceCategory(
      image: "assets/images/grapic_design.png",
      name: "GRAPHIC DESIGN",
    ),
    ServiceCategory(
      image: "assets/images/webflow.jpeg",
      name: "WEBFLOW",
    ),
    ServiceCategory(
      image: "assets/images/gohighlevel.png",
      name: "GOHIGHLEVEL",
    ),
    ServiceCategory(
      image: "assets/images/reactjs.jpeg",
      name: "REACT JS",
    ),
    ServiceCategory(
      image: "assets/images/wowrdpress.png",
      name: "WORDPRESS",
    ),
    ServiceCategory(
      image: "assets/images/shopify.png",
      name: "SHOPIFY",
    ),
    ServiceCategory(
      image: "assets/images/ios.jpeg",
      name: "App Development",
    ),
    ServiceCategory(
      image: "assets/images/sdlc.jpg",
      name: "SOFTWARE DESIGN",
    ),
    ServiceCategory(
      image: "assets/images/js.png",
      name: "JS",
    ),
  ].obs;

  List tremMember = <TermMember>[
    TermMember(
        image: "assets/images/palash.jpg",
        name: "Palash Chandra  Roy",
        department: "Flutter Developer"),
    TermMember(
        image: "assets/images/webflow.jpeg",
        name: "Palash Chandra  Roy",
        department: "Flutter Developer"),
    TermMember(
        image: "assets/images/gohighlevel.png",
        name: "Palash Chandra  Roy",
        department: "Flutter Developer"),
    TermMember(
        image: "assets/images/reactjs.jpeg",
        name: "Palash Chandra  Roy",
        department: "Flutter Developer"),
    TermMember(
        image: "assets/images/wowrdpress.png",
        name: "Palash Chandra  Roy",
        department: "Flutter Developer"),
    TermMember(
        image: "assets/images/shopify.png",
        name: "Palash Chandra  Roy",
        department: "Flutter Developer"),
    TermMember(
        image: "assets/images/ios.jpeg",
        name: "Palash Chandra  Roy",
        department: "Flutter Developer"),
    TermMember(
        image: "assets/images/web.jpeg",
        name: "Palash Chandra  Roy",
        department: "Flutter Developer"),
    TermMember(
        image: "assets/images/sdlc.jpg",
        name: "Palash Chandra  Roy",
        department: "Flutter Developer"),
    TermMember(
        image: "assets/images/js.png",
        name: "Palash Chandra  Roy",
        department: "Flutter Developer"),
    TermMember(
        image: "assets/images/web.jpeg",
        name: "Palash Chandra  Roy",
        department: "Flutter Developer"),
  ].obs;

  List<String> bannerImages = [
    'assets/images/banner.png',
    'assets/images/banner1.png',
    'assets/images/banner.png',
  ].obs;
}

class TermMember {
  final String image;
  final String name;
  final String department;

  TermMember(
      {required this.image, required this.name, required this.department});
}

class ServiceCategory {
  final String image;
  final String name;

  ServiceCategory({
    required this.image,
    required this.name,
  });
}

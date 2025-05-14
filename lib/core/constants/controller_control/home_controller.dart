import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/features/home/logic/home_page_view_scroll_controller.dart';

class HomeController extends GetxController {
  var categoryScrollController = ScrollController();
  var resetProjectController = ScrollController();
  var baseProjectController = ScrollController();
  var teamController = ScrollController();
  var pageViwerScrollController = PageViwerScrollController();
  var teamPageController = PageController(viewportFraction: 0.5);

  var currentTeamPage = 0.obs;
  var selectedCategoryIndex = 0.obs;

  var currentPage = 0.obs;

  var isCategoryAtStart = true.obs;
  var isCategoryAtEnd = false.obs;
  var isProjectAtStart = true.obs;
  var isProjectAtEnd = false.obs;
  var isBestProjectAtStart = true.obs;
  var isBestProjectAtEnd = false.obs;
  var isTeamStart = true.obs;
  var isTeamEnd = false.obs;

  @override
  void onInit() {
    super.onInit();

    teamController.addListener(_updateScrollButtonState);

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
    categoryScrollController.dispose();
    resetProjectController.dispose();
    baseProjectController.dispose();
    teamController.dispose();
    super.onClose();
  }

  void _updateScrollButtonState() {
    isTeamStart.value =
        teamController.offset <= teamController.position.minScrollExtent + 10;
    isTeamEnd.value =
        teamController.offset >= teamController.position.maxScrollExtent - 10;
  }

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
}

class ServiceCategory {
  final String image;
  final String name;

  ServiceCategory({
    required this.image,
    required this.name,
  });
}

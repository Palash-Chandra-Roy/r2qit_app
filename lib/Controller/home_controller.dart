import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedCategoryIndex = 0.obs;

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
  var currentPage = 0.obs;

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

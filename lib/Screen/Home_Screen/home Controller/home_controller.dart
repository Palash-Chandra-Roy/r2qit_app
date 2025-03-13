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
        discription: "Graphic design ."),
    ServiceCategory(
        image: "assets/images/webflow.jpeg",
        name: "WEBFLOW",
        discription:
            "Webflow is a powerful no-code website design and development platform...."),
    ServiceCategory(
        image: "assets/images/gohighlevel.png",
        name: "GOHIGHLEVEL",
        discription:
            "GoHighLevel (GHL) is an all-in-one marketing automation platform designed for agencies.."),
    ServiceCategory(
        image: "assets/images/reactjs.jpeg",
        name: "REACT JS",
        discription:
            "React.js is a powerful JavaScript library for building fast, scalable, and interactive user interfaces.."),
    ServiceCategory(
        image: "assets/images/wowrdpress.png",
        name: "WORDPRESS",
        discription:
            "WordPress is an open-source content management system (CMS) that allows users to create..."),
    ServiceCategory(
        image: "assets/images/shopify.png",
        name: "SHOPIFY",
        discription:
            "hopify is a leading e-commerce platform designed to help businesses of all sizes create"),
    ServiceCategory(
        image: "assets/images/ios.jpeg",
        name: "App Development",
        discription:
            "App development is the process of creating software applications that run on mobile, desktops, orweb.."),
    ServiceCategory(
        image: "assets/images/sdlc.jpg",
        name: "SOFTWARE DESIGN",
        discription:
            "Software design is the process of defining the architecture, components, interfaces..."),
    ServiceCategory(
        image: "assets/images/js.png",
        name: "JS",
        discription:
            "avaScript (JS) is a high-level, interpreted programming language used primarily..."),
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
  final String discription;

  ServiceCategory(
      {required this.image, required this.name, required this.discription});
}

import 'package:get/get.dart';

class ServiceController extends GetxController {
  List services = [
    Services(
        image: "assets/images/grapic_design.png",
        name: "GRAPHIC DESIGN",
        discription: "Graphic design ."),
    Services(
        image: "assets/images/webflow.jpeg",
        name: "WEBFLOW",
        discription:
            "Webflow is a powerful no-code website design ..,Webflow is a powerful no-code website design"),
    Services(
        image: "assets/images/gohighlevel.png",
        name: "GOHIGHLEVEL",
        discription: "GoHighLevel (GHL) is an all-in-one marketing "),
    Services(
        image: "assets/images/reactjs.jpeg",
        name: "REACT JS",
        discription: "React.js is a powerful JavaScript library for building"),
    Services(
        image: "assets/images/wowrdpress.png",
        name: "WORDPRESS",
        discription: "WordPress is an open-source content management "),
    Services(
        image: "assets/images/shopify.png",
        name: "SHOPIFY",
        discription: "hopify is a leading e-commerce platform "),
    Services(
        image: "assets/images/ios.jpeg",
        name: "App Development",
        discription: "App development is the process of creating software "),
    Services(
        image: "assets/images/sdlc.jpg",
        name: "SOFTWARE DESIGN",
        discription: "Software design is the process "),
    Services(
        image: "assets/images/js.png",
        name: "JS",
        discription: "avaScript (JS) is a high-level,"),
  ].obs;
}

class Services {
  final String image;
  final String name;
  final String discription;

  Services(
      {required this.image, required this.name, required this.discription});
}

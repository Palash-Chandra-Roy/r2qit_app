import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/Screen/BottomNavBar/bottom_navbar_controller.dart';
import 'package:r2ait_app/Screen/Card%20Screen/card_screen.dart';
import 'package:r2ait_app/Screen/Fevarit%20Screen/fevarid_screen.dart';
import 'package:r2ait_app/Screen/Home_Screen/home_screen.dart';
import 'package:r2ait_app/Screen/Profile%20Screen/profile_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomnavbarScreen();
}

class _BottomnavbarScreen extends State<BottomNavbarScreen> {
  final BottomNavController controller = Get.put(BottomNavController());

  final selectedIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    FevaridScreen(),
    CardScreen(),
    ProfileScreen(),
  ];

/*
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> iconTextList = ["Home", "Favorite", "Card", "Profile"];
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Icon(
          Icons.center_focus_strong,
          color: Colors.amber,
        ),
      ),
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 24, 92, 209),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              onTap: controller.changeIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: "Favorite",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  label: "Card ",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "Preson",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

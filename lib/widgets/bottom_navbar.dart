import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/features/home/presentation/screen/faq_page.dart';
import 'package:r2ait_app/features/home/presentation/screen/home.dart';
import 'package:r2ait_app/features/home/presentation/screen/job.dart';
import 'package:r2ait_app/features/home/presentation/screen/service.dart';
import 'package:r2ait_app/features/profile/presentation/screen/profile.dart';

import '../core/constants/controller_control/bottomnavbar_controller.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});
  @override
  State<BottomNavbar> createState() => _Bottomnavbar();
}

class _Bottomnavbar extends State<BottomNavbar> {
  final BottomNavController controller = Get.put(BottomNavController());

  final selectedIndex = 0;

  List<Widget> pages = [
    Home(),
    Service(),
    Job(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          goToFaqPage();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 4, 56, 5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 30,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Icon(MaterialCommunityIcons.frequently_asked_questions,
              size: 30, color: Colors.white),
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
              selectedItemColor: Colors.black,
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
                    Icons.engineering,
                  ),
                  label: "Services ",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.work,
                  ),
                  label: "Job",
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

  void goToFaqPage() {
    Get.to(() => FAQPage());
  }
}

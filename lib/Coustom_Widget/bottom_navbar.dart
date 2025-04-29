import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/Controller/bottomnavbar_controller.dart';
import 'package:r2ait_app/UI%20Screen/home.dart';
import 'package:r2ait_app/UI%20Screen/job.dart';
import 'package:r2ait_app/UI%20Screen/profile.dart';
import 'package:r2ait_app/UI%20Screen/service.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          // Get.to(QrCodeGenerator());
        },
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
}

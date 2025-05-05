import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/features/home/presentation/screen/about.dart';
import 'package:r2ait_app/features/home/presentation/screen/edit_profile.dart';
import 'package:r2ait_app/features/profile/presentation/screen/setting.dart';

import '../../domain/change_dark_mode.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ThemeController themeController = ThemeController();
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            themeController.toggleTheme();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Your toggle logic here
            },
            icon: Icon(isDark ? Icons.sunny : Icons.dark_mode),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Stack(
                children: [
                  SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/palash.jpg",
                          width: 100, // Set width and height as needed
                          height: 100,
                          fit: BoxFit.cover, // Ensure proper fitting
                        ),
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        Get.to(EditProfile());
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.yellow),
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Palash Chandra Roy ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "palash@r2ait.com ",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(EditProfile());
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    backgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  child: Text(
                    "Edit Profile ",
                  )),
              SizedBox(
                height: 20,
              ),
              ProfileManWidget(
                title: "Setting",
                icon: Icon(Icons.settings),
                onPress: () {
                  goToSettingPage();
                },
              ),
              ProfileManWidget(
                title: "About",
                icon: Image.asset(
                  "assets/images/logo.png",
                  height: 24,
                  width: 24,
                ),
                onPress: () {
                  Get.to(About());
                },
              ),
              ProfileManWidget(
                  title: "Billing Details",
                  icon: Icon(
                    Icons.book,
                  ),
                  onPress: () {}),
              ProfileManWidget(
                  title: "User Managment",
                  icon: Icon(Icons.personal_injury),
                  onPress: () {}),
              Divider(),
              ProfileManWidget(
                  title: "Information", icon: Icon(Icons.info), onPress: () {}),
              ProfileManWidget(
                title: "Logout",
                icon: Icon(Icons.logout),
                onPress: () {},
                textColor: Colors.red,
                endIcon: false,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void goToSettingPage() {
    Get.to(Setting());
  }
}

class ProfileManWidget extends StatelessWidget {
  const ProfileManWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final Widget icon; // <-- This can be Icon(...) or Image.asset(...)
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.apply(color: textColor),
      ),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: Center(child: icon), // ✅ directly use the passed icon Widget
      ),
      trailing: endIcon
          ? Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            )
          : null,
    );
  }
}

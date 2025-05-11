import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/core/constants/fontsize_control/widget_support.dart';
import 'package:r2ait_app/features/home/presentation/screen/about.dart';
import 'package:r2ait_app/features/home/presentation/screen/edit_profile.dart';
import 'package:r2ait_app/features/profile/presentation/screen/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../auth/presentation/screen/signin.dart';
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
    final id = Get.parameters['id'];

    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    double screenHeight = MediaQuery.of(context).size.height;
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
          child: Text("Profile", style: AppWidget.appBarTextFeildStyle()),
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
        child: Column(children: [
          GestureDetector(
              onTap: () {
                Get.to(EditProfile());
              },
              child: profileCart(screenHeight: screenHeight)),
          Divider(),
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
            onPress: () {
              Get.defaultDialog(
                title: "Logout",
                middleText: "Are you sure you want to logout?",
                textConfirm: "Yes",
                textCancel: "No",
                confirmTextColor: Colors.white,
                onConfirm: () {
                  LogOut();
                },
              );
            },
            textColor: Colors.red,
            endIcon: false,
          ),
        ]),
      ),
    );
  }

  void LogOut() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
    Get.offAll(() => Signin());
  }

  void goToSettingPage() {
    Get.to(Setting());
  }
}

class profileCart extends StatelessWidget {
  const profileCart({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.1,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white70,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ClipOval(
              child: Image.asset(
                "assets/images/palash.jpg",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Palash Chandra Roy",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("palashr2ait@gmail.com",
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
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

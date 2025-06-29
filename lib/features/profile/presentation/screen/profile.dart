import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:r2ait_app/core/constants/fontsize_control/widget_support.dart';
import 'package:r2ait_app/features/home/presentation/screen/about.dart';
import 'package:r2ait_app/features/profile/presentation/screen/edit_profile.dart';
import 'package:r2ait_app/features/profile/presentation/screen/setting.dart';
import 'package:r2ait_app/utils/theme_changer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../model/user_data_model.dart';
import '../../../auth/presentation/screen/signin.dart';
import '../../../map/presentation/screen/map.dart';
import '../../data/user_data_controller.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserDataController _userDataController = Get.find<UserDataController>();
  ThemeChanger _themeChanger = Get.put(ThemeChanger());

  String formatDate(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return "No birth date";
    try {
      final parsedDate = DateTime.parse(rawDate);
      return DateFormat('dd MMMM yyyy', 'bn').format(parsedDate);
    } catch (e) {
      try {
        final parsedDate = DateTime.parse(rawDate);
        return DateFormat('dd MMMM yyyy')
            .format(parsedDate); // fallback English
      } catch (e) {
        return rawDate;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
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
          Obx(() {
            bool isDark = _themeChanger.isDarkMode.value;
            return IconButton(
                onPressed: () {
                  _themeChanger.toggleTheme();
                },
                icon: isDark
                    ? Icon(
                        Icons.sunny,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.dark_mode,
                        color: Colors.black,
                      ));
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          profileCart(
            userDataController: _userDataController,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GetBuilder(
                init: _userDataController,
                builder: (UserData) {
                  var user = UserData.members;
                  return Column(
                    children: [
                      ContactInfoRow(icon: Icons.phone, text: "${user?.phone}"),
                      SizedBox(height: 10),
                      ContactInfoRow(icon: Icons.email, text: "${user?.email}"),
                      SizedBox(height: 10),
                      ContactInfoRow(
                        icon: Icons.calendar_month,
                        text: formatDate("${user?.dateOfBirth}"),
                      ),
                      SizedBox(height: 10),
                      ContactInfoRow(icon: Icons.man, text: "${user?.gender}"),
                      SizedBox(height: 10),
                      ContactInfoRow(
                          icon: Icons.language_sharp, text: "${user?.website}"),
                      SizedBox(height: 10),
                      ContactInfoRow(
                          icon: Icons.location_on, text: "${user?.address}"),
                    ],
                  );
                }),
          ),
          SizedBox(
            height: 10,
          ),
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
              onPress: () {
                Get.to(EditProfile());
              }),
          Divider(),
          ProfileManWidget(
              title: "Location",
              icon: Icon(Icons.location_on_outlined),
              onPress: () {
                Get.to(() => const MapPage());
              }),
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

  @override
  void initState() {
    super.initState();
    _userDataController.getUserData();
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
  UserDataController userDataController;
  profileCart({super.key, required this.userDataController});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.32,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white70,
      ),
      child: GetBuilder(
          init: userDataController,
          builder: (userData) {
            UserDataModel? user = userData.members;
            return Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Cover Image
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        image: DecorationImage(
                          image: NetworkImage("${user?.coverImage}"
                              //"https://www.shutterstock.com/shutterstock/videos/3606751217/thumb/1.jpg?ip=x480",
                              ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Profile Image with Edit Icon
                    Positioned(
                      bottom: -50,
                      left: screenWidth / 2 - 50,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              "${user?.profileImage}",
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(Icons.edit,
                                  size: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${user?.firstName} ${user?.lastName}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("${user?.username}",
                          style:
                              TextStyle(fontSize: 14, color: Colors.black54)),
                      Text("${user?.profession}",
                          style:
                              TextStyle(fontSize: 14, color: Colors.black54)),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueGrey),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
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

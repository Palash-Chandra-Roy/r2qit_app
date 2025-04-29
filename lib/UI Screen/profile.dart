import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/UI%20Screen/edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
            Get.back();
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
                      )
                      //  ClipRRect(
                      //   borderRadius: BorderRadius.circular(100),
                      //   child: Image(
                      //     image: AssetImage("assets/images/palash.jpg"),
                      //   ),
                      // ),
                      ),
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
              // CircleAvatar(
              //   radius: 60,
              //   backgroundImage: AssetImage("assets/image/palash.jpg"),
              // ),
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
                    elevation: 5,
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                  ),
                  child: Text("Edit Profile ")),
              // SizedBox(
              //   height: 20,
              // ),
              SizedBox(
                height: 20,
              ),
              ProfileManWidget(
                title: "Setting",
                icon: Icons.settings,
                onPress: () {},
              ),
              ProfileManWidget(
                  title: "Billing Details", icon: Icons.book, onPress: () {}),
              ProfileManWidget(
                  title: "User Managment",
                  icon: Icons.personal_injury,
                  onPress: () {}),
              Divider(),
              ProfileManWidget(
                  title: "Information", icon: Icons.info, onPress: () {}),
              ProfileManWidget(
                title: "Logout",
                icon: Icons.logout,
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
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyLarge?.apply(color: textColor)),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.white),
        child: Icon(
          icon,
          size: 18,
        ),
      ),
      trailing: endIcon
          ? Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            )
          : null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
        title: Center(
          child: Text(
            "Edit Profile",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
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
                        // Get to Edit profile picture
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.yellow),
                        child: Icon(
                          Icons.camera_alt,
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
                height: 30,
              ),

              ElevatedButton(
                  onPressed: () {},
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
            ]),
          ),
        ),
      ),
    );
  }
}

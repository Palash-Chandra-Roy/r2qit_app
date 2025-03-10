import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FevaridScreen extends StatefulWidget {
  const FevaridScreen({super.key});

  @override
  State<FevaridScreen> createState() => _FevaridScreenState();
}

class _FevaridScreenState extends State<FevaridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Fevarid Screen ",
          style: TextStyle(
              fontSize: 16, color: Colors.black12, fontWeight: FontWeight.bold),
        ),
        //leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Icon(
            Icons.notifications,
            size: 30,
          )
        ],
      ),
      body: Center(
        child: Text("Fevarid Screen"),
      ),
    );
  }
}
/*

class ProfileScreens extends StatelessWidget {
  const ProfileScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.add)),
        title: Text(
          "hello",
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? Icons.sunny : Icons.dark_mode))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage("assets/images/palash.jpg"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.amber),
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("hi"),
              Text("adsfasdf"),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const ProfileScreens()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text("asdfsadf",
                      style: TextStyle(color: Colors.amber)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              // ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: () {}),
              // ProfileMenuWidget(title: "Billing Details", icon: LineAwesomeIcons.wallet, onPress: () {}),
              // ProfileMenuWidget(title: "User Management", icon: LineAwesomeIcons.user_check, onPress: () {}),
              // const Divider(),
              // const SizedBox(height: 10),
              // ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info, onPress: () {}),
              // ProfileMenuWidget(
              //     title: "Logout",
              //     icon: Icon(Icons.search),
              //     textColor: Colors.red,
              //     endIcon: false,
              //     onPress: () {
              //       Get.defaultDialog(
              //         title: "LOGOUT",
              //         titleStyle: const TextStyle(fontSize: 20),
              //         content: const Padding(
              //           padding: EdgeInsets.symmetric(vertical: 15.0),
              //           child: Text("Are you sure, you want to Logout?"),
              //         ),
              //         confirm: Expanded(
              //           child: ElevatedButton(
              //             onPressed: () => ProfileScreen(),
              //             style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
              //             child: const Text("Yes"),
              //           ),
              //         ),
              //         cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
              //       );
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}*/

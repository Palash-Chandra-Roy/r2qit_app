import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/Controller/home_controller.dart';
import 'package:r2ait_app/UI%20Screen/notification_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Super, Key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: screenHeight * 0.04,
          width: screenWidth * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey, width: 1)),
          child: TextField(
            onTap: () {},
            obscureText: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("Chatting Option ");
              },
              icon: Icon(
                Icons.offline_bolt,
                size: 20,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () => goToNotificationPage(context),
              icon: Icon(
                Icons.notifications,
                size: 20,
                color: Colors.black,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * .15,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/banner.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Service Categary ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All Service",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.add,
                            size: 16,
                            color: Colors.black,
                          )),
                    ],
                  )
                ],
              ),
              Container(
                height: screenHeight * 0.15,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: _homeController.serviceCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: screenHeight * 0.15,
                        width: screenWidth * 0.31,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 8, left: 5, right: 5)),
                              SizedBox(
                                  height: 55,
                                  width: 55,
                                  child: ClipOval(
                                    child: Image.asset(
                                      _homeController
                                          .serviceCategories[index].image,
                                      fit: BoxFit.cover,
                                      height: screenHeight * 0.5,
                                      width: screenWidth * 0.5,
                                    ),
                                  )),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              Text(
                                _homeController.serviceCategories[index].name,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                              // Center(
                              //   child: Text(
                              //     _homeController
                              //         .serviceCategories[index].discription,
                              //     style: TextStyle(
                              //         fontSize: 7, color: Colors.black),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Center(
                child: Text(
                  " Your Team Member",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                height: screenHeight * 0.4,
                width: double.infinity,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 1,
                      crossAxisCount: 3,
                    ),
                    itemCount: _homeController.serviceCategories.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                _homeController.tremMember[index].image,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.005,
                            ),
                            Text(
                              _homeController.tremMember[index].name,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: screenHeight * 0.005,
                            ),
                            Text(
                              _homeController.tremMember[index].department,
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "About Us",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: screenHeight * 0.2,
                width: double.infinity,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToNotificationPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (builder) => NotificationPage()),
        (predicate) => false);
  }
}

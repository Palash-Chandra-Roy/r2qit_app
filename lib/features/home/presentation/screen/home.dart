import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/features/home/presentation/screen/faq_page.dart';
import 'package:r2ait_app/features/home/presentation/screen/notification_page.dart';
import 'package:r2ait_app/features/home/presentation/screen/support_chat_page.dart';
import 'package:r2ait_app/utils/custom_project_details.dart';

import '../../../../core/constants/controller_control/home_controller.dart';
import '../../../../core/constants/fontsize_control/widget_support.dart';
import '../../../service/presentation/screen/service_list.dart';

class Home extends StatelessWidget {
  Home({Super, Key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          height: screenHeight * 0.05,
          width: screenWidth * 0.7,
          child: TextField(
            onTap: () {},
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: "Search",
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: goToSupportPage,
              icon: Icon(
                Entypo.chat,
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
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: 150,
                child: PageView.builder(
                  itemCount: _homeController.bannerImages.length,
                  onPageChanged: (index) {
                    _homeController.currentPage.value = index;
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          _homeController.bannerImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Service Categary ",
                        style: AppWidget.homeTextFeildStyle()),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "See More",
                        style: AppWidget.appBarTextFeildStyle(),
                      ),
                    )
                  ]),
              GestureDetector(
                onTap: () {
                  goToServiceListPage();
                },
                child: Container(
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
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Resent Project", style: AppWidget.homeTextFeildStyle()),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "All Project",
                      style: AppWidget.appBarTextFeildStyle(),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.3,
                width: screenWidth,
                child: ListView.builder(
                    itemCount: _homeController.serviceCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final service = _homeController.serviceCategories[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomServiceDetailsCard(
                          goToDetailsPage: goToDetailsPage,
                          service: service,
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Best Project", style: AppWidget.homeTextFeildStyle()),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "All Project",
                      style: AppWidget.appBarTextFeildStyle(),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.3,
                width: screenWidth,
                child: ListView.builder(
                    itemCount: _homeController.serviceCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final service = _homeController.serviceCategories[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomServiceDetailsCard(
                          goToDetailsPage: goToDetailsPage,
                          service: service,
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                child: Text(" Your Team Member",
                    style: AppWidget.homeTextFeildStyle()),
              ),
              Container(
                height: screenHeight * 0.45,
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
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToDetailsPage() {}

  void goToNotificationPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (builder) => NotificationPage()),
        (predicate) => true);
  }

  void goToServiceListPage() {
    Get.to(() => ServiceListPage());
  }

  void goToFaqPage() {
    Get.to(() => FAQPage());
  }

  void goToSupportPage() {
    Get.to(() => SupportChatPage());
  }

  void goToDetaileProject() {}
  void goToResentDetailsProject() {}
}

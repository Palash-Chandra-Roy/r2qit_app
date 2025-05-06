import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/core/constants/controller_control/home_controller.dart';
import 'package:r2ait_app/core/constants/fontsize_control/widget_support.dart';
import 'package:r2ait_app/features/home/presentation/screen/faq_page.dart';
import 'package:r2ait_app/features/home/presentation/screen/notification_page.dart';
import 'package:r2ait_app/features/home/presentation/screen/support_chat_page.dart';
import 'package:r2ait_app/features/service/presentation/screen/service_list.dart';
import 'package:r2ait_app/widgets/custom_project_details.dart';

import '../../../../core/constants/controller_control/home_controller.dart';
import '../../../../core/constants/fontsize_control/widget_support.dart';
import '../../../service/presentation/screen/service_list.dart';
import '../widget/contract_from.dart';

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
              hintText: "search".tr,
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
                  controller: _homeController.bannerPageController,
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
                    Text("service_category".tr,
                        style: AppWidget.homeTextFeildStyle()),
                  ]),
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.15,
                    width: double.infinity,
                    child: ListView.builder(
                      controller: _homeController.categoryScrollController,
                      itemCount: _homeController.serviceCategories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => goToServiceListPage(),
                          child: SizedBox(
                            height: screenHeight * 0.15,
                            width: screenWidth * 0.31,
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 55,
                                    width: 55,
                                    child: ClipOval(
                                      child: Image.asset(
                                        _homeController
                                            .serviceCategories[index].image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Text(
                                    _homeController
                                        .serviceCategories[index].name,
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Left Button
                  Positioned(
                    left: -5,
                    bottom: 45,
                    child: LeftScrollerButton(
                      scrollController:
                          _homeController.categoryScrollController,
                      isAtStart: _homeController.isCategoryAtStart,
                    ),
                  ),

                  // Right Button
                  Positioned(
                    right: -5,
                    bottom: 45,
                    child: RightScrollerButton(
                      scrollController:
                          _homeController.categoryScrollController,
                      isAtEnd: _homeController.isCategoryAtEnd,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("recent_project".tr,
                      style: AppWidget.homeTextFeildStyle()),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Text(
                  //     "all_project".tr,
                  //     style: AppWidget.appBarTextFeildStyle(),
                  //   ),
                  // )
                ],
              ),
              Stack(
                children: [
                  SizedBox(
                    height: screenHeight * 0.3,
                    width: screenWidth,
                    child: ListView.builder(
                      controller: _homeController.resetProjectController,
                      itemCount: _homeController.serviceCategories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final service =
                            _homeController.serviceCategories[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomServiceDetailsCard(
                            goToDetailsPage: goToDetailsPage,
                            service: service,
                          ),
                        );
                      },
                    ),
                  ),
                  // Left Button
                  Positioned(
                    left: -8,
                    bottom: 120,
                    child: LeftScrollerButton(
                      scrollController: _homeController.resetProjectController,
                      isAtStart: _homeController.isProjectAtStart,
                    ),
                  ),

                  // Right Button
                  Positioned(
                    right: -8,
                    bottom: 120,
                    child: RightScrollerButton(
                      scrollController: _homeController.resetProjectController,
                      isAtEnd: _homeController.isProjectAtEnd,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("best_project".tr,
                      style: AppWidget.homeTextFeildStyle()),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Text(
                  //     "all_project".tr,
                  //     style: AppWidget.appBarTextFeildStyle(),
                  //   ),
                  // )
                ],
              ),
              Stack(
                children: [
                  SizedBox(
                    height: screenHeight * 0.3,
                    width: screenWidth,
                    child: ListView.builder(
                        controller: _homeController.baseProjectController,
                        itemCount: _homeController.serviceCategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final service =
                              _homeController.serviceCategories[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomServiceDetailsCard(
                              goToDetailsPage: goToDetailsPage,
                              service: service,
                            ),
                          );
                        }),
                  ),
                  Positioned(
                    left: -8,
                    bottom: 120,
                    child: LeftScrollerButton(
                      scrollController: _homeController.baseProjectController,
                      isAtStart: _homeController.isBestProjectAtStart,
                    ),
                  ),

                  // Right Button
                  Positioned(
                    right: -8,
                    bottom: 120,
                    child: RightScrollerButton(
                      scrollController: _homeController.baseProjectController,
                      isAtEnd: _homeController.isBestProjectAtEnd,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                child: Text("our_team_members".tr,
                    style: AppWidget.homeTextFeildStyle()),
              ),
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.15,
                    width: double.infinity,
                    child: ListView.builder(
                        controller: _homeController.teamController,
                        itemCount: _homeController.serviceCategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: screenHeight * 0.15,
                            width: screenWidth * 0.31,
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
                                        _homeController.tremMember[index].image,
                                        fit: BoxFit.cover,
                                        height: screenHeight * 0.5,
                                        width: screenWidth * 0.5,
                                      ),
                                    )),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ),
                                Text(
                                  _homeController.tremMember[index].name,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black),
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
                  Positioned(
                    left: -5,
                    bottom: 45,
                    child: LeftScrollerButton(
                      scrollController: _homeController.teamController,
                      isAtStart: _homeController.isTeamStart,
                    ),
                  ),

                  // Right Button
                  Positioned(
                    right: -5,
                    bottom: 45,
                    child: RightScrollerButton(
                      scrollController: _homeController.teamController,
                      isAtEnd: _homeController.isTeamEnd,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // ... your_team_member grid এর নিচে
              SizedBox(height: 20),

              /// ✅ Contract Form Section
              ContractFormWidget(),

              SizedBox(height: 20),
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

class LeftScrollerButton extends StatelessWidget {
  final ScrollController scrollController;
  final RxBool isAtStart;

  const LeftScrollerButton({
    super.key,
    required this.scrollController,
    required this.isAtStart,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => IconButton(
          onPressed: isAtStart.value
              ? null
              : () {
                  scrollController.animateTo(
                    scrollController.offset - 150,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: isAtStart.value ? Colors.grey : Colors.green,
          ),
        ));
  }
}

class RightScrollerButton extends StatelessWidget {
  final ScrollController scrollController;
  final RxBool isAtEnd;

  const RightScrollerButton({
    super.key,
    required this.scrollController,
    required this.isAtEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => IconButton(
          onPressed: isAtEnd.value
              ? null
              : () {
                  scrollController.animateTo(
                    scrollController.offset + 150,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: isAtEnd.value ? Colors.grey : Colors.green,
          ),
        ));
  }
}

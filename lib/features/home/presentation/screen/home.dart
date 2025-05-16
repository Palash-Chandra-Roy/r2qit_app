import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/core/constants/controller_control/home_controller.dart';
import 'package:r2ait_app/core/constants/fontsize_control/widget_support.dart';
import 'package:r2ait_app/features/home/presentation/screen/faq_page.dart';
import 'package:r2ait_app/features/home/presentation/screen/notification_page.dart';
import 'package:r2ait_app/features/home/presentation/screen/support_chat_page.dart';
import 'package:r2ait_app/features/home/presentation/widget/Custom_home_best_project.dart';
import 'package:r2ait_app/features/home/presentation/widget/custom_home_recent_project.dart';
import 'package:r2ait_app/features/home/presentation/widget/custom_home_service_category.dart';
import 'package:r2ait_app/features/home/presentation/widget/custom_team_member.dart';
import 'package:r2ait_app/features/service/presentation/screen/category.dart';

import '../widget/contact_from.dart';
import '../widget/custom_home_page_view.dart';

class Home extends StatelessWidget {
  Home({Super, Key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    //final TeamController _teamController = Get.find<TeamController>();
    //final tab =Get.parameters['tab']; // Dynamically received parameter from URL
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
              hintText: "search".tr,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              //contentPadding: EdgeInsets.symmetric(horizontal: 12),
              suffixIcon: Icon(Icons.search),
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
              CustomHomePageView(homeController: _homeController),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("service_category".tr,
                        style: AppWidget.homeTextFeildStyle()),
                    InkWell(
                        onTap: () {
                          Get.to(Service());
                        },
                        child: Text(
                          "See more",
                          style: AppWidget.homeTextFeildStyle(),
                        ))
                  ]),
              CustomHomeServiceCategory(
                homeController: _homeController,
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("recent_project".tr,
                      style: AppWidget.homeTextFeildStyle()),
                ],
              ),
              CustomHomeRecentProject(homeController: _homeController),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("best_project".tr,
                      style: AppWidget.homeTextFeildStyle()),
                ],
              ),
              CustomHomeBestProject(homeController: _homeController),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                child: Text("your_team_member".tr,
                    style: AppWidget.homeTextFeildStyle()),
              ),
              CustomTeamMember(homeController: _homeController),

              SizedBox(
                height: screenHeight * 0.01,
              ),

              /// ✅ Contract Form Section
              ContactFormWidget(),
              SizedBox(
                height: screenHeight * 0.01,
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
        (predicate) => true);
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

import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/App%20Fontsize/widget_support.dart';
import 'package:r2ait_app/Controller/home_controller.dart';
import 'package:r2ait_app/UI%20Screen/faq_page.dart';
import 'package:r2ait_app/UI%20Screen/notification_page.dart';
import 'package:r2ait_app/UI%20Screen/support_chat_page.dart';

class Home extends StatelessWidget {
  Home({Super, Key});
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
                  InkWell(
                    onTap: () {},
                    child: Text("Service Categary ",
                        style: AppWidget.homeTextFeildStyle()),
                  ),
                  Row(
                    children: [
                      Text(
                        "All Service",
                        style: AppWidget.appBarTextFeildStyle(),
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
              Container(
                height: screenHeight * 0.15,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: _homeController.serviceCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        height: screenHeight * 0.12,
                        width: screenWidth * 0.28,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 8, left: 5, right: 5)),
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
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
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
              Container(
                height: screenHeight * 0.15,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: _homeController.serviceCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        height: screenHeight * 0.15,
                        width: screenWidth * 0.28,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 238, 45, 55),
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.only(top: 8, left: 5, right: 5),
                                height: 60,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                  _homeController
                                      .serviceCategories[index].image,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: screenHeight * 0.001,
                            ),
                            Text(
                              _homeController.serviceCategories[index].name,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                            SizedBox(
                              height: screenHeight * 0.001,
                            ),
                            Text(
                              _homeController.serviceCategories[index].name,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
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
                child: Center(
                  child: Text(
                    "About Us",
                    style: AppWidget.homeTextFeildStyle(),
                  ),
                ),
              ),
              CustomAboutAs()
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          goToFaqPage();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 30,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Icon(MaterialCommunityIcons.frequently_asked_questions,
              size: 35, color: Colors.white),
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
}

class CustomAboutAs extends StatelessWidget {
  const CustomAboutAs({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Container(
      height: height * 0.2,
      width: double.infinity,
      color: Colors.green.shade100,
      child: Row(
        children: [
          SizedBox(
            height: height,
            width: width * 0.4,
            child: Image.network(
              "https://img.freepik.com/free-photo/team-developers-doing-brainstorming-optimizing-code_482257-112972.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "At our company, our Customer Service Department is wholly "
                "committed to delivering unparalleled service to our valued customers."
                " From the very first point of contact, customers are warmly welcomed with "
                "a friendly smile and a supportive demeanor. Our team undergoes rigorous "
                "training to adeptly handle customer requests and inquiries with efficiency "
                "and efficacy, ensuring a remarkable experience that upholds the elevated"
                " standards we hold dear.",
                style: TextStyle(fontSize: 14),
                overflow: TextOverflow.fade,
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

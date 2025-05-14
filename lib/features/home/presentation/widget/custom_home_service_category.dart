import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/core/constants/controller_control/home_controller.dart';
import 'package:r2ait_app/features/home/presentation/screen/home.dart';
import 'package:r2ait_app/features/service/presentation/screen/service_list.dart';

class CustomHomeServiceCategory extends StatelessWidget {
  const CustomHomeServiceCategory({
    super.key,
    required HomeController homeController,
  }) : _homeController = homeController;
  final HomeController _homeController;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.15,
          width: double.infinity,
          child: ListView.builder(
            controller: _homeController.categoryScrollController,
            itemCount: _homeController.serviceCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var service = _homeController.serviceCategories[index];
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
                              service.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          service.name,
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
            scrollController: _homeController.categoryScrollController,
            isAtStart: _homeController.isCategoryAtStart,
          ),
        ),

        // Right Button
        Positioned(
          right: -5,
          bottom: 45,
          child: RightScrollerButton(
            scrollController: _homeController.categoryScrollController,
            isAtEnd: _homeController.isCategoryAtEnd,
          ),
        ),
      ],
    );
  }

  void goToServiceListPage() {
    Get.to(() => ServiceListPage());
  }
}

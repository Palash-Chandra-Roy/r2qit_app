import 'package:flutter/material.dart';
import 'package:r2ait_app/core/constants/controller_control/home_controller.dart';
import 'package:r2ait_app/features/home/presentation/screen/home.dart';
import 'package:r2ait_app/widgets/custom_project_details.dart';

class CustomHomeBestProject extends StatelessWidget {
  const CustomHomeBestProject({
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
        SizedBox(
          height: screenHeight * 0.3,
          width: screenWidth,
          child: ListView.builder(
              controller: _homeController.baseProjectController,
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
    );
  }

  void goToDetailsPage() {}
}

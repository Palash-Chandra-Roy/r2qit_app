import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../core/constants/controller_control/home_controller.dart';
import '../../../../core/constants/image_controller/image_controller.dart';

class CustomHomePageView extends StatelessWidget {
  const CustomHomePageView({
    super.key,
    required HomeController homeController,
  }) : _homeController = homeController;

  final HomeController _homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          height: 150,
          child: Obx(() => PageView.builder(
                controller: _homeController.bannerPageController,
                itemCount: ImageController.bannerImages.length,
                onPageChanged: (index) {
                  _homeController.currentPage.value = index;
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        ImageController.bannerImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              )),
        ),
        const SizedBox(height: 8),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                ImageController.bannerImages.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _homeController.currentPage.value == index ? 12 : 8,
                  height: _homeController.currentPage.value == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: _homeController.currentPage.value == index
                        ? Colors.green
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}

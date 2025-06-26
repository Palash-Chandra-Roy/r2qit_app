import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:r2ait_app/core/constants/controller_control/home_controller.dart';
import 'package:r2ait_app/core/constants/fontsize_control/widget_support.dart';
import 'package:r2ait_app/features/home/data/team_data_controller.dart';
import 'package:r2ait_app/features/home/presentation/screen/home.dart';

class CustomTeamMember extends StatelessWidget {
  const CustomTeamMember({
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
            height: screenHeight * 0.25,
            width: double.infinity,
            child: GetBuilder<TeamDataController>(builder: (team_member) {
              return Visibility(
                visible: !team_member.isLoading,
                replacement: Center(
                    child:
                        CircularProgressIndicator()), // যখন member থাকবে তখনই দেখাবে
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _homeController.teamController,
                  itemCount: team_member.members.length,
                  itemBuilder: (context, index) {
                    var member = team_member.members[index];
                    return Container(
                      width: screenWidth * 0.45,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: screenWidth * 0.23,
                            width: screenWidth * 0.23,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "${member.imageUrl}"), // এখানেই member.image দেওয়া উচিত
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(member.name,
                              style: AppWidget.simpleTextFeildStyle()),
                          Text("${member.title}",
                              style: AppWidget.descriptionText()),
                        ],
                      ),
                    );
                  },
                ),
              );
            })),

        // Left Scroll Button
        Positioned(
          left: 0,
          top: screenHeight * 0.1,
          child: LeftScrollerButton(
            scrollController: _homeController.teamController,
            isAtStart: _homeController.isTeamStart,
          ),
        ),

        // Right Scroll Button
        Positioned(
          right: 0,
          top: screenHeight * 0.1,
          child: RightScrollerButton(
            scrollController: _homeController.teamController,
            isAtEnd: _homeController.isTeamEnd,
          ),
        ),
      ],
    );
  }
}

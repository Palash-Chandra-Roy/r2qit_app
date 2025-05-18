import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:r2ait_app/core/constants/api_control/teams%20_api.dart';
import 'package:r2ait_app/core/utils/data_controller.dart';

import '../../../model/team_mamber_model.dart';

class TeamController extends GetxController {
  Logger logger = Logger();
  List<TeamMemberModel> members = [];
  late bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    fetchTeamMembers();
  }

  void fetchTeamMembers() async {
    isLoading = true;
    update();
    try {
      List data =
          await DataController.getDataFrame(TeamsApiController.allTeamMember);
      members = data.map((e) => TeamMemberModel.fromJson(e)).toList();
    } catch (e) {
      logger.e("Error fetching team members: $e");
    } finally {
      isLoading = false;
      update();
    }
  }
}

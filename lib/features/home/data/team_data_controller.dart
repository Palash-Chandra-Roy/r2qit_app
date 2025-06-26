import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:r2ait_app/core/constants/api_control/teams%20_api.dart';
import 'package:r2ait_app/core/utils/global_get_data_frame.dart';
import '../../../model/team_mamber_model.dart';

class TeamDataController extends GetxController {
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
          await GlobalGetDataFrame.getDataFrame(TeamsApiController.allTeamMember);
      members = data.map((e) => TeamMemberModel.fromJson(e)).toList();
    } catch (e) {
    } finally {
      isLoading = false;
      update();
    }
  }
}

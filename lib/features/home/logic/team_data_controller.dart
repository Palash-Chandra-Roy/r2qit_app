import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:r2ait_app/core/constants/api_control/teams%20_api.dart';

import '../../../model/team_mamber_model.dart';

class TeamController extends GetxController {
  var members = <TeamMember>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeamMembers();
  }

  void fetchTeamMembers() async {
    Uri uri = Uri.parse(TeamsApiController.allTeamMember);
    final response = await http.get(uri);
    final Map<String, dynamic> json = jsonDecode(response.body);
    final List data = json['data'];

    members.value = data.map((e) => TeamMember.fromJson(e)).toList();
  }
}

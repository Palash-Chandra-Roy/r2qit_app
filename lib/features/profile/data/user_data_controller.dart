import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:r2ait_app/core/constants/api_control/auth_api.dart';
import 'package:r2ait_app/core/utils/global_get_data_frame.dart';
import 'package:r2ait_app/model/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataController extends GetxController {
  Logger logger = Logger();

  UserDataModel? members;
  late bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');
    isLoading = true;
    update();
    try {
      List data = await GlobalGetDataFrame.getDataFrame(
          "${AuthAPIController.singleUser("$id")}");
      members = UserDataModel.fromJson(data[0]);
    } catch (e) {
    } finally {
      isLoading = false;
      update();
    }
  }
}

import 'package:get/get.dart';
import 'package:r2ait_app/features/home/data/category_data_controller.dart';
import 'package:r2ait_app/features/map/logic/get_Current_location.dart';
import 'package:r2ait_app/features/profile/data/user_data_controller.dart';
import 'package:r2ait_app/utils/admin_check.dart';

import 'features/home/data/team_data_controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.put<ServiceControl>(ServiceControl());
    Get.put<TeamDataController>(TeamDataController());
    Get.put<UserDataController>(UserDataController());
    Get.put<LocationController>(LocationController());
    Get.put<CategoryDataController>(CategoryDataController());
  }
}

import 'package:get/get.dart';
import 'package:r2ait_app/utils/admin_check.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.put<ServiceControl>(ServiceControl());
  }
}

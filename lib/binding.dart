import 'package:get/get.dart';
import 'package:r2ait_app/features/service/logic/admin_check.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceControl>(() => ServiceControl());
  }
}

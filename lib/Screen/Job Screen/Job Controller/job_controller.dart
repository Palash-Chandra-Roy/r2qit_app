import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class JobController extends GetxController {
  List jobTitle = [
    JobTitle(
      title: "Preferences",
    ),
    JobTitle(
      title: " My Jobs",
    ),
    JobTitle(
      title: "Post a free job ",
    ),
    JobTitle(
      title: "Manage job posts ",
    ),
  ].obs;
}

class JobTitle {
  final String title;

  JobTitle({required this.title});
}

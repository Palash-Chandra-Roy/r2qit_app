import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:r2ait_app/core/utils/global_get_data_frame.dart';
import '../../../core/constants/api_control/category_api.dart';
import '../../../model/category_model.dart';


class CategoryDataController extends GetxController {
  List<CategoryModel> category = [];
  late bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    fetchCategory();
  }

  void fetchCategory() async {
    isLoading = true;
    update();
    try {
      List data =
      await GlobalGetDataFrame.getDataFrame(CategoryApiController.allCategory);
      category = data.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      Logger().e(e);
    } finally {
      isLoading = false;
      update();
    }
  }
}

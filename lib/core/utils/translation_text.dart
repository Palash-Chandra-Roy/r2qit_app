import 'package:get/get.dart';

import '../constants/text controler/setting_text.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': settingTextEn,
        "bn": settingTextBn,
      };
}

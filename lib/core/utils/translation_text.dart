import 'package:get/get.dart';
import 'package:r2ait_app/core/constants/text%20controler/setting_text.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          ...homeTextEn,
          ...settingTextEn,
          ...faqTextEn,
          ...aboutPageEn,
        },
        "bn": {
          ...homeTextBn,
          ...settingTextBn,
          ...faqTextBn,
          ...aboutPageBn,
        },
      };
}

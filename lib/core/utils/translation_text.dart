import 'package:get/get.dart';

import '../constants/text controler/text.dart';

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

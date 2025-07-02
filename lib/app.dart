import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/theme/light_dark_theme.dart';
import 'package:r2ait_app/theme/logic/theme_changer.dart';

import '../../routing/routes.dart';
import 'binding.dart';
import 'utils/translation_text.dart';

class MyApp extends StatelessWidget {
  final Locale locale;
  MyApp({super.key, required this.locale});
  @override
  Widget build(BuildContext context) {
    ThemeChanger theme = Get.put(ThemeChanger());
    return GetBuilder<ThemeChanger>(builder: (theme) {
      return Obx(() {
        return GetMaterialApp(
          translations: AppTranslations(),
          locale: locale,
          fallbackLocale: Locale('bn'),
          title: 'R2AIT',
          debugShowCheckedModeBanner: false,
          theme: themeMood(),
          initialRoute: AppRoutes.initial,
          getPages: AppRoutes.routes,
          defaultTransition: Transition.fade,
          initialBinding: BindingController(),
        );
      });
    });
  }
}

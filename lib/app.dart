import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/utils/theme_controler.dart';

import '../../routing/routes.dart';
import 'binding.dart';
import 'core/utils/translation_text.dart';

class MyApp extends StatelessWidget {
  final Locale locale;
  MyApp({super.key, required this.locale});
  ThemeChanger themeChanger = Get.put(ThemeChanger());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: locale,
      fallbackLocale: Locale('bn'),
      title: 'R2AIT',
      debugShowCheckedModeBanner: false,
      theme: themeChanger.themeMode,
      // darkTheme: darkMode,
      // themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
      defaultTransition: Transition.fade,
      initialBinding: BindingController(),

      // routes: AppRoutes.routes,
    );
  }
}

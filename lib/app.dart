import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/theme/light_theme.dart';

import '../../routing/routes.dart';
import '../../theme/dark_theme.dart';
import 'core/utils/translation_text.dart';

class MyApp extends StatelessWidget {
  final Locale locale;
  MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: locale,
      fallbackLocale: Locale('bn'),
      title: 'R2AIT',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.initial,
      routes: AppRoutes.routes,
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:r2ait_app/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'features/notification/logic/firebase_messaging_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();
  final savedLangCode = prefs.getString('language') ?? 'en';

  await FirebaseMessageController().initsFCM();

  runApp(ScreenUtilInit(
    designSize: Size(390, 844),
      splitScreenMode: true,
      minTextAdapt: true,
    child: MyApp(
      locale: Locale(savedLangCode),
    ),
  ));
}

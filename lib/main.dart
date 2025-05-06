import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/features/auth/Auth%20Controller/auth_Controller.dart';
import 'package:r2ait_app/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize AuthController once globally
  Get.put(AuthController());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  final savedLangCode = prefs.getString('language') ?? 'en';

  runApp(MyApp(
    locale: Locale(savedLangCode),
  ));
}

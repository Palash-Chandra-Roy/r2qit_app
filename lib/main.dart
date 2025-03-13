import 'package:flutter/material.dart';

import 'package:r2ait_app/Screen/Home_Screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:r2ait_app/Screen/Splash%20Screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'R2AIT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen()
        //HomeScreen(),

        );
  }
}

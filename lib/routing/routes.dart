import 'package:flutter/material.dart';
import 'package:r2ait_app/features/home/presentation/screen/home.dart';

import '../features/service/presentation/screen/service_list.dart';
import '../features/splash/presentation/screen/splash.dart';

class AppRoutes {
  static const String initial = '/';

  static Map<String, WidgetBuilder> routes = {
    initial: (context) => SplashScreen(),
    '/': (context) => SplashScreen(),
    '/home': (context) => Home(),
    '/service': (context) => ServiceListPage(),
  };
}

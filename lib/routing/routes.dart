import 'package:get/get.dart';
import 'package:r2ait_app/features/profile/presentation/screen/profile.dart';

import '../features/home/presentation/screen/home.dart';
import '../features/service/presentation/screen/service_list.dart';
import '../features/splash/presentation/screen/splash.dart';

class AppRoutes {
  static const String initial = '/';
  static const String home = '/home/:tap';
  static const String service = '/service';
  static const String profile = '/profile/:id';

  static final List<GetPage> routes = [
    GetPage(name: initial, page: () => SplashScreen()),
    GetPage(name: home, page: () => Home()),
    GetPage(name: service, page: () => ServiceListPage()),
    GetPage(name: profile, page: () => Profile()),
  ];
}

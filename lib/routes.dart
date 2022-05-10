import 'package:get/get.dart';

import 'control/bindings/binding.dart';
import 'view/screens/info_screen.dart';
import 'view/screens/login_screen.dart';
import 'view/screens/register_screen.dart';
import 'view/screens/splash_screen.dart';

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const info = '/info';
  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen(), binding: Binding()),
    GetPage(name: login, page: () => const LoginScreen(), binding: Binding()),
    GetPage(
        name: register, page: () => const RegisterScreen(), binding: Binding()),
    GetPage(name: info, page: () => InfoScreen(), binding: Binding()),
  ];
}

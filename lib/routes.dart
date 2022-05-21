import 'package:get/get.dart';

import 'control/bindings/binding.dart';
import 'view/screens/activities_screen.dart';
import 'view/screens/diet_screen.dart';
import 'view/screens/meal_screen.dart';
import 'view/screens/goal_screen.dart';
import 'view/screens/info_screen.dart';
import 'view/screens/login_screen.dart';
import 'view/screens/register_screen.dart';
import 'view/screens/splash_screen.dart';

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const info = '/info';
  static const goal = '/goal';
  static const diet = '/diet';
  static const meal = '/meal';
  static const activity = '/activity';
  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen(), binding: Binding()),
    GetPage(name: login, page: () => const LoginScreen(), binding: Binding()),
    GetPage(
        name: register, page: () => const RegisterScreen(), binding: Binding()),
    GetPage(name: info, page: () => const InfoScreen(), binding: Binding()),
    GetPage(name: goal, page: () => const GoalScreen(), binding: Binding()),
    GetPage(name: diet, page: () => const DietScreen(), binding: Binding()),
    GetPage(
        name: activity,
        page: () => const ActivitiesScreen(),
        binding: Binding()),
    GetPage(name: meal, page: () => const MealScreen(), binding: Binding()),
  ];
}

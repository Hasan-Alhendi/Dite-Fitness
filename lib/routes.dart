import 'package:get/get.dart';

import 'control/bindings/binding.dart';
import 'view/screens/activities_screen.dart';
import 'view/screens/alternatives_screen.dart';
import 'view/screens/diet_screen.dart';
import 'view/screens/disease_screen.dart';
import 'view/screens/edit_info_screen.dart';
import 'view/screens/exercis_details_screen.dart';
import 'view/screens/exercise_day_screen.dart';
import 'view/screens/exercise_list_screen.dart';
import 'view/screens/exercise_screen.dart';
import 'view/screens/meal_screen.dart';
import 'view/screens/goal_screen.dart';
import 'view/screens/info_screen.dart';
import 'view/screens/login_screen.dart';
import 'view/screens/notifications_screen.dart';
import 'view/screens/register_screen.dart';
import 'view/screens/splash_screen.dart';
import 'view/screens/training_exercises_screen.dart';
import 'view/screens/unlikefood_screen.dart';
import 'view/widget/bottom_bar.dart';

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const info = '/info';
  static const editInfo = '/editInfo';
  static const goal = '/goal';
  static const diet = '/diet';
  static const meal = '/meal';
  static const activity = '/activity';
  static const unlikeFood = '/unlikeFood';
  static const alternatives = '/alternatives';
  static const bottomBar = '/bottomBar';
  static const disease = '/disease';
  static const trainingExercises = '/trainingExercises';
  static const exerciseDayScreen = '/exerciseDayScreen';
  static const exerciseListScreen = '/exerciseListScreen';
  static const exerciseScreen = '/exerciseScreen';
  static const exerciseDetailsScreen = '/exerciseDetailsScreen';
  static const notificationsScreen = '/notificationsScreen';

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen(), binding: Binding()),
    GetPage(name: login, page: () => const LoginScreen(), binding: Binding()),
    GetPage(
        name: register, page: () => const RegisterScreen(), binding: Binding()),
    GetPage(name: info, page: () => const InfoScreen(), binding: Binding()),
    GetPage(
        name: editInfo, page: () => const EditInfoScreen(), binding: Binding()),
    GetPage(name: goal, page: () => const GoalScreen(), binding: Binding()),
    GetPage(name: diet, page: () => DietScreen(), binding: Binding()),
    GetPage(
        name: activity,
        page: () => const ActivitiesScreen(),
        binding: Binding()),
    GetPage(name: meal, page: () => const MealScreen(), binding: Binding()),
    GetPage(
        name: disease, page: () => const DiseaseScreen(), binding: Binding()),
    GetPage(
        name: unlikeFood,
        page: () => const UnlikeFoodScreen(),
        binding: Binding()),
    GetPage(
        name: alternatives,
        page: () => const AlternativesScreen(),
        binding: Binding()),
    GetPage(name: bottomBar, page: () => const BottomBar(), binding: Binding()),
    GetPage(
        name: exerciseListScreen,
        page: () => const ExerciseListScreen(),
        binding: Binding()),
    GetPage(
        name: exerciseDayScreen,
        page: () => const ExerciseDayScreen(),
        binding: Binding()),
    GetPage(
        name: trainingExercises,
        page: () => const TrainingExercisesScreen(),
        binding: Binding()),
    GetPage(
        name: exerciseScreen,
        page: () => const ExerciseScreen(/* mediaUrl: '' */),
        binding: Binding()),
    GetPage(
        name: exerciseDetailsScreen,
        page: () => const ExerciseDetailsScreen(),
        binding: Binding()),
    GetPage(
        name: notificationsScreen,
        page: () => const NotificationsScreen(),
        binding: Binding()),
  ];
}

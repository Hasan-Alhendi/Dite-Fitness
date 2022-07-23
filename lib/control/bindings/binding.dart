import 'package:get/get.dart';

import '../controllers/activities_controller.dart';
import '../controllers/diet_controller.dart';
import '../controllers/diseases_controller.dart';
import '../controllers/exercise_details_controller.dart';
import '../controllers/exercise_controller.dart';
import '../controllers/food_controller.dart';
import '../controllers/goal_controller.dart';
import '../controllers/info_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/notifications_controller.dart';
import '../controllers/register_controller.dart';
import '../controllers/splash_controller.dart';
import '../controllers/training_exercises_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
    Get.lazyPut(() => InfoController(), fenix: true);
    Get.lazyPut(() => GoalController(), fenix: true);
    Get.lazyPut(() => DietController(), fenix: true);
    Get.lazyPut(() => ActivitiesController(), fenix: true);
    Get.lazyPut(() => FoodController(), fenix: true);
    Get.lazyPut(() => DiseasesController(), fenix: true);
    Get.lazyPut(() => TrainingExercisesController(), fenix: true);
    Get.lazyPut(() => ExerciseController(), fenix: true);
    Get.lazyPut(() => ExerciseDetailscontroller(), fenix: true);
    Get.lazyPut(() => NotificationsController(), fenix: true);
  }
}

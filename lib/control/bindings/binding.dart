import 'package:get/get.dart';

import '../controllers/activities_controller.dart';
import '../controllers/diet_controller.dart';
import '../controllers/goal_controller.dart';
import '../controllers/info_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/register_controller.dart';
import '../controllers/splash_controller.dart';

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
  }
}

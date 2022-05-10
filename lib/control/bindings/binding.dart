import 'package:get/get.dart';

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
  }
}

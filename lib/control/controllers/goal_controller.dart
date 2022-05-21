import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/servises/Goal_services.dart';
import '../../routes.dart';

class GoalController extends GetxController {
  var isLoding = false.obs;
  RxInt selectedIndex = 0.obs;

  setGoal({required goalId}) async {
    const apiToken = FlutterSecureStorage();
    String? x = await apiToken.read(key: 'token');

    //await GoalServises.setGoal(apiToken: apiToken, goal: goal);
    await GoalServises.setGoal(
      apiToken: x,
      goalId: goalId,
    );
    Get.toNamed(Routes.diet);
  }
}

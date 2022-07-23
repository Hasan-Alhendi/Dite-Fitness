import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/classes/goal.dart';
import '../../model/servises/Goal_services.dart';
import '../../routes.dart';

class GoalController extends GetxController {
  var isLoading = true.obs;
  final storage = const FlutterSecureStorage();

  RxInt selectedIndex = 99.obs;
  var goals = <Goal>[].obs;

  @override
  void onInit() {
    super.onInit();
    getGoals();
  }

  getGoals() async {
    try {
      isLoading(true);
      const apiToken = FlutterSecureStorage();
      String? x = await apiToken.read(key: 'token');
      goals.value = await GoalServises.getGoals(apiToken: x);
    } finally {
      isLoading(false);
    }
  }

  setGoal({required goalId}) async {
    const apiToken = FlutterSecureStorage();
    String? x = await apiToken.read(key: 'token');

    //await GoalServises.setGoal(apiToken: apiToken, goal: goal);
    var res = await GoalServises.setGoal(
      apiToken: x,
      goalId: goalId,
    );
    await storage.write(key: 'route', value: 'goal');
    if (res == null) {
      return;
    } else {
      Get.toNamed(Routes.activity);
    }
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/classes/activity.dart';
import '../../model/servises/activities_services.dart';
import '../../routes.dart';

class ActivitiesController extends GetxController {
  var isLoading = true.obs;
  final storage = const FlutterSecureStorage();

  var activities = <Activity>[].obs;
  var selectedIndex = 99.obs;

  @override
  void onInit() {
    super.onInit();
    getActivities();
  }

  getActivities() async {
    try {
      isLoading(true);
      const apiToken = FlutterSecureStorage();
      String? x = await apiToken.read(key: 'token');
      activities.value = await ActivitiesService.getActivities(apiToken: x);
    } finally {
      isLoading(false);
    }
  }

  setActivity({required activityId}) async {
    const apiToken = FlutterSecureStorage();
    String? x = await apiToken.read(key: 'token');

    var res = await ActivitiesService.setActivity(
        apiToken: x, activityId: activityId);
    await storage.write(key: 'route', value: 'activity');
    if (res == null) {
      return;
    } else {
      Get.toNamed(Routes.unlikeFood);
    }
  }
}

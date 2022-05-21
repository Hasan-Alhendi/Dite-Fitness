import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/classes/activity.dart';
import '../../model/servises/activities_services.dart';
import '../../routes.dart';

class ActivitiesController extends GetxController {
  var isLoding = false.obs;
  var activities = <Activity>[].obs;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getActivities();
    //print(foods);
  }

  getActivities() async {
    const apiToken = FlutterSecureStorage();
    String? x = await apiToken.read(key: 'token');
    activities.value = await ActivitiesService.getActivities(apiToken: x);
  }

  setActivity({required activityId}) async {
    const apiToken = FlutterSecureStorage();
    String? x = await apiToken.read(key: 'token');

    await ActivitiesService.setActivity(apiToken: x, activityId: activityId);
    Get.toNamed(Routes.goal);
  }
}

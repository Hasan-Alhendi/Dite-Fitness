import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/servises/notifications_services.dart';

class NotificationsController extends GetxController {
  final GlobalKey<FormState> notificationsFormKey = GlobalKey<FormState>();
  late TextEditingController firstMealController,
      secondMealController,
      thirdMealController;
  var dayList = [].obs;
  var isLoading = true.obs;

  var sat = false.obs,
      sun = false.obs,
      mon = false.obs,
      tus = false.obs,
      wen = false.obs,
      thu = false.obs,
      fri = false.obs;
  @override
  void onInit() {
    firstMealController = TextEditingController();
    secondMealController = TextEditingController();
    thirdMealController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstMealController.dispose();
    secondMealController.dispose();
    thirdMealController.dispose();
    super.dispose();
  }

  setNotifications() async {
    try {
      dayList.sort();
      isLoading(true);
      const token = FlutterSecureStorage();
      String? apiToken = await token.read(key: 'token');
      await NotificationsServices.setMealNotifications(
          apiToken: apiToken,
          firstTime: firstMealController.text,
          secondTime: secondMealController.text,
          thirdTime: thirdMealController.text);
      await NotificationsServices.setDayExerciseNotifications(
          apiToken: apiToken, dayList: dayList);
    } finally {
      isLoading(false);
    }
  }
}

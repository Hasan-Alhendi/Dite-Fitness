import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../routes.dart';

class SplashController extends GetxController {
  /*  @override
  void onInit() {
    super.onInit();
    // moveToNext();

    // startTime();
  }
 */
  var storage = const FlutterSecureStorage();
  //InfoController infoController = Get.find();
  @override
  void onReady() {
    //moveToNext();
    Future.delayed(const Duration(milliseconds: 2000), () async {
      var token = await storage.read(key: 'token');
      token != null
          ? {
              // infoController.getUserInfo(),
              // infoController.isAddInfo.value = true,
              //   infoController.user.value.firstName = data.firstName,
              //   infoController.user.value.lastName = data.lastName,
              //   infoController.user.value.gender = data.gender,
              //   infoController.user.value.height = data.height,
              //   infoController.user.value.weight = data.weight,
              //   infoController.user.value.birthDate = data.birthDate,
              //   infoController.initialInfo(),
              Get.offNamed(Routes.login),
              //infoController.getUserInfo(),
              //Get.offNamed(Routes.login),
              //infoController.isAddInfo.value = true,
            }
          : Get.offNamed(Routes.login);
    });

    super.onReady();
  }

  /*  startTime() async {
    var duration = const Duration(seconds: 6);
    return Timer(duration, route);
  } */
/* route() {
    Get.toNamed(Routes.bottomBar);
  } */

  Future<void> moveToNext() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      Get.toNamed(Routes.bottomBar);
    });
  }
}

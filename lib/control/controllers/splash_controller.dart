import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // moveToNext();

    // startTime();
  }

  var storage = const FlutterSecureStorage();

  @override
  void onReady() {
    //moveToNext();
    Future.delayed(const Duration(milliseconds: 2000), () async {
      var token = await storage.read(key: 'token');
      token != null
          ? Get.offNamed(Routes.bottomBar)
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

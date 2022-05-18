import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/servises/Goal_services.dart';

class GoalController extends GetxController {
  var isLoding = false.obs;
  RxInt selectedIndex = 0.obs;
  var id = Get.arguments;

  setGoal() async {
    final api_Token = const FlutterSecureStorage();
    String? x = await api_Token.read(key: 'token');

    await GoalServises.setGoal(api_Token: x, id: id, goal: 'goal');
  }
}

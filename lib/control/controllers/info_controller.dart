import 'package:flutter/Material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/servises/info_services.dart';
import '../../routes.dart';

class InfoController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var isLoding = false.obs;

  RxInt selectedIndex = 0.obs;
  final GlobalKey<FormState> infoFormKey = GlobalKey<FormState>();
  late TextEditingController firstNameController,
      lastNameController,
      heightController,
      wightController,
      birthDateController;
  String firstName = '', lastName = '';
  int height = 0, wight = 0;
  DateTime birthDate = DateTime.now();

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    heightController = TextEditingController();
    birthDateController = TextEditingController();
    wightController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    heightController.dispose();
    birthDateController.dispose();
    wightController.dispose();
    super.dispose();
  }

  updateInfo() async {
    const token = FlutterSecureStorage();
    String? apiToken = await token.read(key: 'token');
    bool isValidate = infoFormKey.currentState!.validate();
    if (isValidate) {
      isLoding.value = true; //  isLoding(true);
      try {
        await InfoServises.updateInfo(
            apiToken: apiToken,
            birthDate: selectedDate.value.toIso8601String(),
            firstName: firstNameController.text,
            gender: selectedIndex.value == 1
                ? 'ذكر'
                : (selectedIndex.value == 2 ? 'انثى' : ''),
            height: heightController.text,
            lastName: lastNameController.text);

        infoFormKey.currentState!.save();
//TODO bottombar
        Get.toNamed(Routes.activity);
      } finally {
        isLoding(false);
      }
    }
  }
}

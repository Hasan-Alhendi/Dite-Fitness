import 'package:dite_fitness/control/controllers/login_controller.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/servises/info_services.dart';
import '../../routes.dart';

class InfoController extends GetxController {
  var isLoding = false.obs;
  var isLoading = false.obs;
  var isWeightLoding = false.obs;
  var route = ''.obs;
  var selectedDate = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;
  var isAddInfo = false.obs;
  final storage = const FlutterSecureStorage();

  final GlobalKey<FormState> informationFormKey = GlobalKey<FormState>();
  late TextEditingController firstNameController,
      lastNameController,
      heightController,
      wightController,
      birthDateController;
  String firstName = '', lastName = '';
  int height = 0, wight = 0;
  DateTime birthDate = DateTime.now();
  LoginController loginController = Get.find();
  @override
  void onInit() {
    routeStorage();
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

  routeStorage() async {
    const storage = FlutterSecureStorage();
    route.value = (await storage.read(key: 'route') ?? '');
  }

  updateInfo() async {
    const token = FlutterSecureStorage();
    String? apiToken = await token.read(key: 'token');
    bool isValidate = informationFormKey.currentState!.validate();
    if (isValidate) {
      isLoding.value = true; //  isLoding(true);
      try {
        var res = await InfoServises.updateInfo(
          apiToken: apiToken,
          birthDate: /*birthDateController
              .text*/
              selectedDate.value.toIso8601String(),
          firstName: firstNameController.text,
          gender: selectedIndex.value == 1
              ? 'ذكر'
              : (selectedIndex.value == 2 ? 'انثى' : ''),
          height: heightController.text,
          lastName: lastNameController.text,
          weight: wightController.text,
        );
        informationFormKey.currentState!.save();

        // await storage.write(key: 'route', value: 'info');
        if (res == null) {
          return;
        } else {
          if (isAddInfo.value == false) {
            Get.toNamed(Routes.disease);
          } else {
            return;
          }
        }
      } finally {
        isLoding(false);
      }
    }
  }

  updateWeight() async {
    try {
      isLoading(true);
      const token = FlutterSecureStorage();
      String? apiToken = await token.read(key: 'token');
      await InfoServises.updateWeight(
          apiToken: apiToken, weight: wightController.text);
    } finally {
      isLoading(false);
    }
  }
}

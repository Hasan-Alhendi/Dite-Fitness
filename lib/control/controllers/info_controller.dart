import 'package:flutter/Material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/servises/info_services.dart';

class InfoController extends GetxController {
  var selectedDate = DateTime(1990).obs;
  var isLoding = false.obs;
  var route = ''.obs;
  RxInt selectedIndex = 0.obs;
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
    print('await storage.read(key: )');
    print(await storage.read(key: 'route'));
    route.value = (await storage.read(key: 'route') ?? '');
  }

  updateInfo() async {
    const token = FlutterSecureStorage();
    String? apiToken = await token.read(key: 'token');
    bool isValidate = informationFormKey.currentState!.validate();
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
          lastName: lastNameController.text,
          weight: wightController.text,
        );

        informationFormKey.currentState!.save();
        // await storage.write(key: 'route', value: 'info');
      } finally {
        isLoding(false);
      }
    }
  }

  updateWeight() async {
    const token = FlutterSecureStorage();
    String? apiToken = await token.read(key: 'token');
    await InfoServises.updateWeight(
        apiToken: apiToken, weight: wightController.text);
  }
}

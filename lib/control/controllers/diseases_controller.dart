import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/classes/disease.dart';
import '../../model/servises/disease_services.dart';
import '../../routes.dart';

class DiseasesController extends GetxController {
  var isLoading = true.obs;
  RxInt selectedIndex = 99.obs;

  final storage = const FlutterSecureStorage();

  var disease = <Disease>[].obs;
  var diseaseList = <int>[].obs;
  @override
  void onInit() {
    super.onInit();
    getDiseases();
  }

  getDiseases() async {
    try {
      const apiToken = FlutterSecureStorage();
      String? x = await apiToken.read(key: 'token');
      disease.value = await DiseaseService.getDisease(apiToken: x);
    } finally {
      isLoading(false);
    }
  }

  setDiseases({required List<int> diseasesId}) async {
    const apiToken = FlutterSecureStorage();
    String? x = await apiToken.read(key: 'token');

    var res =
        await DiseaseService.setDiseases(apiToken: x, diseaseId: diseasesId);
    await storage.write(key: 'route', value: 'disease');
    //print(res);
    if (res == null) {
      return;
    } else {
      Get.toNamed(Routes.goal);
    }
  }
}

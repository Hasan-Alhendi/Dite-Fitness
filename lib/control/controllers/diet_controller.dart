import 'package:dite_fitness/model/classes/diet.dart';
import 'package:dite_fitness/model/classes/meal.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/servises/diet_services.dart';

class DietController extends GetxController {
  var isLoading = true.obs;
  var isLoadingMeal = true.obs;
  var diteIndex = 0.obs;
  var meal = Meal(mealId: null, dietId: null, type: null, foods: null).obs;
  // RxList<Diet> diets = <Diet>[].obs;

  RxString mealName = ''.obs;
  Rx<Diet> diet = Diet(
          dietId: null,
          calory: null,
          modelNumber: null,
          protien: null,
          carbohydrate: null,
          fats: null,
          meals: null)
      .obs;
  @override
  void onInit() {
    super.onInit();

    getDiet(index: diteIndex.value);
  }

  getDiet({required index}) async {
    try {
      isLoading(true);
      const apiToken = FlutterSecureStorage();
      String? x = await apiToken.read(key: 'token');
      diet.value = await DietServices.getDiet(apiToken: x, index: index);
    } finally {
      isLoading(false);
    }
  }

  getMeal({required dietIndex, required mealIndex}) async {
    try {
      isLoadingMeal(true);
      const apiToken = FlutterSecureStorage();
      String? x = await apiToken.read(key: 'token');
      meal.value = await DietServices.getMeal(
          apiToken: x, dietIndex: dietIndex, mealIndex: mealIndex);
    } finally {
      isLoadingMeal(false);
    }
  }

  /* setMeal() async {
    const apiToken = FlutterSecureStorage();
    String? x = await apiToken.read(key: 'token');

    await FoodServices.setFoodsMeal(
        apiToken: x,
        mealId: meal.value.mealId!,
        dietId: meal.value.dietId!,
        type: meal.value.type!,
        foods: meal.value.foods!);
    // Get.toNamed(Routes.alternatives);
  }
 */
}

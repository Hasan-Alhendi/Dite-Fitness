import 'package:dite_fitness/model/classes/diet.dart';
import 'package:dite_fitness/model/classes/food.dart';
import 'package:dite_fitness/model/classes/meal.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/servises/diet_services.dart';
import '../../routes.dart';

class DietController extends GetxController {
  var isLoding = false.obs;
  RxList<Diet> diets = DietServices.extractedDiets.obs;
  RxList<List<Meal>?> meals = DietServices.extractedMeals.obs;
  RxList<List<Food>?> foods = DietServices.extractedFoods.obs;
  @override
  void onInit() {
    super.onInit();
    getDiet();
    getMeals();
    getFoods();

    //print(foods);
  }

  getDiet() async {
    const apiToken = FlutterSecureStorage();
    String? x = await apiToken.read(key: 'token');
    print(x);
    diets.value = await DietServices.getDiet(apiToken: x);
    print(diets);
  }

  getDiet1() async {
    Get.toNamed(Routes.goal);
  }

  getMeals() async {
    const apiToken = FlutterSecureStorage();
    String? x = await apiToken.read(key: 'token');
    meals.value = await DietServices.getMeals(apiToken: x);
  }

  getFoods() async {
    const apiToken = FlutterSecureStorage();
    String? x = await apiToken.read(key: 'token');
    foods.value = await DietServices.getFoods(apiToken: x);
  }
}

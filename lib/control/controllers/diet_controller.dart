import 'package:dite_fitness/model/classes/diet.dart';
import 'package:dite_fitness/model/classes/food.dart';
import 'package:dite_fitness/model/classes/meal.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/servises/diet_services.dart';

class DietController extends GetxController {
  var isLoading = true.obs;
  var isLoadingMeal = true.obs;
  var diteIndex = 0.obs;

  RxList<Diet> diets = <Diet>[].obs;
  RxList<List<Meal>?> meals = DietServices.extractedMeals.obs;
  RxList<List<Food>?> foods = DietServices.extractedFoods.obs;
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
  var meal = Meal(mealId: null, dietId: null, type: null, foods: null).obs;
  @override
  void onInit() {
    super.onInit();
    getDiets();
    getMeals();
    getFoods();
    getDiet(index: diteIndex.value);
    //getDiet(index: 0);

    //print(foods);
  }

  getDiet({required index}) async {
    try {
      isLoading(true);
      const apiToken = FlutterSecureStorage();
      String? x = await apiToken.read(key: 'token');
      diet.value = await DietServices.getDiet(apiToken: x, index: index);
      //var d = diets.value;
      //print(d);
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

  getDiets() async {
    const apiToken = FlutterSecureStorage();
    String? x = await apiToken.read(key: 'token');
    // print(x);
    diets.value = await DietServices.getDiets(apiToken: x);
    //var d = diets.value;
    //print(d);
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

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/classes/food.dart';
import '../../model/servises/food_services.dart';
import '../../routes.dart';
import 'diet_controller.dart';

class FoodController extends GetxController {
  var isLoading = true.obs;
  final storage = const FlutterSecureStorage();

  var foods = <Food>[].obs;
  var d = [].obs;
  var alternativesFoods = [].obs;
  var mainFoods = [].obs;
  var unlikeFoodsList = <int>[].obs;
  TextEditingController searchController = TextEditingController();

  DietController dietController = Get.find();

  //RxList<Food> foodList = <Food>[].obs;
  //List<Food> foodTempList = <Food>[];

  @override
  void onInit() {
    super.onInit();
    getFoods();
  }

  getFoods() async {
    try {
      const apiToken = FlutterSecureStorage();
      String? x = await apiToken.read(key: 'token');
      foods.value = await FoodServices.getFoods(apiToken: x);
    } finally {
      isLoading(false);
    }
  }

  setUnlikeFoods({required List<int> foodsId}) async {
    const apiToken = FlutterSecureStorage();
    String? x = await apiToken.read(key: 'token');

    var res = await FoodServices.setUnlikeFood(apiToken: x, foodsId: foodsId);
    await storage.write(key: 'route', value: 'food');
    if (res == null) {
      return;
    } else {
      Get.toNamed(Routes.trainingExercises);
    }
  }

  setMeal() async {
    var ddd = dietController.meal.value;
    const token = FlutterSecureStorage();
    String? apiToken = await token.read(key: 'token');

    await FoodServices.setFoodsMeal(
        apiToken: apiToken,
        mealId: ddd.mealId!,
        dietId: ddd.dietId!,
        type: ddd.type!,
        foods: ddd.foods!);
    mainFoods.value = FoodServices.mainFood;
    alternativesFoods.value = FoodServices.alternativeFood;

    Get.toNamed(Routes.alternatives);
  }

  /* void searchFood(String query) {
    if (query.isEmpty) {
      foodList.value = foodTempList;
    } else {
      foodList.value = foodTempList.where((food) {
        final titleLower = food.foodName!;
        final searchLower = query;

        return titleLower.contains(searchLower);
      }).toList();
    }
  }
 */

}

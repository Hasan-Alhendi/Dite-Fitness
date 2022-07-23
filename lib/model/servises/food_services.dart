import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../const.dart';
import '../classes/food.dart';

class FoodServices {
  // static String url = Const.ip;
  static String urlUser = Const.urlUser;

  static Future<List<Food>> getFoods({required apiToken}) async {
    List<Food> extractedFoods = [];
    var response = await http.get(
      Uri.parse('$urlUser/get-all-foods'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      List activities = valueMap["foods"];

      for (var i = 0; i < activities.length; i++) {
        Food food = Food.unlikeJson(activities[i]);
        extractedFoods.add(food);
      }
    }
    return extractedFoods;
  }

  static setUnlikeFood({required apiToken, required List<int> foodsId}) async {
    // ignore: unused_local_variable
    var response = await http.post(
      Uri.parse('$urlUser/add-unliked_food'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{
        'unliked_food': foodsId,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      Get.snackbar('خطأ', "تأكد من الاتصال بالانترنت");
      print(response.body);
      print('$urlUser/add-unliked_food');
      print(response.statusCode);
      return;
    }
  }

  static List<Food> mainFood = [];
  static List<List<Food>> alternativeFood = [];
  static setFoodsMeal(
      {required apiToken,
      required int mealId,
      required int dietId,
      required int type,
      required List<Food> foods}) async {
    mainFood = [];
    var response = await http.post(
      Uri.parse('$urlUser/get-alternatives-to-meal'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{
        'id': mealId,
        'diet_id': dietId,
        'type': type,
        'foods': foods.map((x) => x.toMap()).toList()
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map valueMap = jsonDecode(response.body);
      List food = valueMap["alternative_meal"];

      var alternativeMapFood = [];

      for (int i = 0; i < food.length; i++) {
        mainFood.add(Food.fromJson(food[i]['main_food']));

        alternativeMapFood.add(food[i]['alternatives']);
      }

      alternativeFood = List.generate(
        alternativeMapFood.length,
        (e) => List.generate(
          alternativeMapFood[e].length,
          (h) => Food.fromJson(alternativeMapFood[e][h]),
        ),
      );

      //User s = User.fromJson(user);
      // return s;
    }
    /* for (int i = 0; i < foods.length; i++) {
      print('foodId');
      print(foods[i].quantity!.foodId);
      print('-----------------------');
      print('count');
      print(foods[i].quantity!.count);
      print('-----------------------');
      print('mealFoodId ');
      print(foods[i].quantity!.mealFoodId);
      print('-----------------------');
      print('mealId ');
      print(foods[i].quantity!.mealId);
      print('-----------------------');

      print('quantityId');
      print(foods[i].quantity!.id);
      print('-----------------------');
    }
    // print('foods[0].quantity!.id');

    print('mealId $mealId');
    print('-----------------------');

    print('type $type');
    print('-----------------------');

    print('dietId $dietId');
    print('-----------------------');

    print('response');
    print('$url/get-alternatives-to-meal');
    print(response.statusCode);
    print(response.body); */
  }

  /* static setFoodsMeal(
      {required apiToken,
      required int mealId,
      required int dietId,
      required int type,
      required List<Food> foods}) async {
    // ignore: unused_local_variable
    var response = await http.post(
      Uri.parse('$urlUser/get-alternatives-to-meal'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{
        //'user_id': id,
        'id': mealId,
        'diet_id': dietId,
        'type': type,
        'foods': foods
      }),
    );
    /*  print('response');
    print('$urlUser/get-alternatives-to-meal');
    print(response.statusCode);
    print(response.body); */
  } */
}

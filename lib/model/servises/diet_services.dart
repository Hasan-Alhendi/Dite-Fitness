import 'dart:convert';

import 'package:get/get.dart';

import '../../const.dart';
import 'package:http/http.dart' as http;

import '../classes/diet.dart';

import '../classes/meal.dart';

class DietServices {
  static String url = Const.urlUser;
  static List diets = [];
  static int modelNumber = 0;

  static Future<int> getActiveDiet({required apiToken}) async {
    var response = await http.get(
      Uri.parse('$url/get-diet-active-user'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      var status = valueMap["status"];

      if (status == true) {
        var dietMap = valueMap["diets"];

        Diet diet = Diet.fromjson(dietMap);
        modelNumber = diet.modelNumber! - 1;
      }
    }
    return modelNumber;
  }

  static Future<Diet> getDiet({required apiToken, required index}) async {
    List<Diet> extractedDiets = [];
    var response = await http.get(
      Uri.parse('$url/get-diet-active-user'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      var status = valueMap["status"];

      if (status == true) {
        var dietMap = valueMap["diets"];

        Diet diet = Diet.fromjson(dietMap);
        extractedDiets.add(diet);
      } else {
        response = await http.get(
          Uri.parse('$url/get-Diet-User'),
          headers: {
            'Content-Type': 'application/json',
            'auth-token': '$apiToken',
          },
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> valueMap = jsonDecode(response.body);

          diets = valueMap["diets"];

          for (var i = 0; i < diets.length; i++) {
            Diet diet = Diet.fromjson(diets[i]);
            extractedDiets.add(diet);
          }
        }
      }
    }
    return extractedDiets[index];
  }

  /*  static Future<Diet> getDiet({required apiToken, required index}) async {
    List<Diet> extractedDiets1 = [];
    var response = await http.get(
      Uri.parse('$url/get-Diet-User'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      diets = valueMap["diets"];

      for (var i = 0; i < diets.length; i++) {
        Diet diet = Diet.fromjson(diets[i]);
        extractedDiets1.add(diet);
      }
    }
    // print(extractedDiets1[index].meals);
    return extractedDiets1[index];
  }
 */
  static Future<Meal> getMeal(
      {required apiToken, required dietIndex, required mealIndex}) async {
    List<Diet> extractedDiets1 = [];
    var response = await http.get(
      Uri.parse('$url/get-Diet-User'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      List diets = valueMap["diets"];

      for (var i = 0; i < diets.length; i++) {
        Diet diet = Diet.fromjson(diets[i]);
        extractedDiets1.add(diet);
      }
    }

    return extractedDiets1[dietIndex].meals![mealIndex];
  }

  static setDiet({
    required apiToken,
    required int dietId,
  }) async {
    var response = await http.post(
      Uri.parse('$url/save-diet'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{
        'diet_id': dietId,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar(
        'النظام الغذائي',
        'تم تأكيد النظام الغذائي',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  static Future<int> checkDietExpire({required apiToken}) async {
    var response = await http.get(
      Uri.parse('$url/check-user-have-diet-active'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
    );
    int status = 99;
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      status = valueMap["user_have_diet_active"];
    }

    return status;
  }
  /*static setFoodsMeal(
      {required apiToken,
      required int mealId,
      required int dietId,
      required int type,
      required List<Food> foods}) async {
    mainFood = [];
    var response = await http.post(
      Uri.parse('$url/get-alternatives-to-meal'),
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

      print(
          '_______________________________________________AlternativeFood_______________________________________________');

      print(alternativeFood);
      print(
          '_______________________________________________MainFood_______________________________________________');

      print(mainFood);
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
  }*/
}

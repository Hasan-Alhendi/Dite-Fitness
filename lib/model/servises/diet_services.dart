import 'dart:convert';

import '../../const.dart';
import 'package:http/http.dart' as http;

import '../classes/diet.dart';

import '../classes/meal.dart';

class DietServices {
  static String url = Const.urlUser;
  static List diets = [];
  //static var mainFood = [];
  //static var alternativeFood = [];
  //static List mainFood1 = [];
  // static List alternativeFood1 = [];
  static Future<Diet> getDiet({required apiToken, required index}) async {
    List<Diet> extractedDiets1 = [];
    var response = await http.get(
      Uri.parse('$url/get-Diet-User'),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
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

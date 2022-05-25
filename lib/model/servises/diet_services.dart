import 'dart:convert';

import '../../const.dart';
import 'package:http/http.dart' as http;

import '../classes/diet.dart';
import '../classes/food.dart';
import '../classes/meal.dart';

class DietServices {
  static String url = Const.urlUser;
  static List<Diet> extractedDiets = [];
  static List<List<Meal>?> extractedMeals = [];
  static List<List<Food>?> extractedFoods = [];

  static Future<List<Diet>> getDiets({required apiToken}) async {
    List<Diet> extractedDiets1 = [];
    var response = await http.get(
      Uri.parse('$url/get-Diet-User'),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'auth-token': '$apiToken',
      },
    );
    // print(response.statusCode);
    // print('$url/get-Diet-User');
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      List diets = valueMap["diets"];

      for (var i = 0; i < diets.length; i++) {
        Diet diet = Diet.fromjson(diets[i]);
        extractedDiets1.add(diet);
      }
    }
    // print(extractedDiets1);
    return extractedDiets1;
  }

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

      List diets = valueMap["diets"];

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
        //'Accept': 'application/json',
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

  static Future<List<List<Meal>?>> getMeals({required apiToken}) async {
    var response = await http.get(
      Uri.parse('$url/get-Diet-User'),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'auth-token': '$apiToken',
      },
    );

    // print(response.body);
    //  print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      List diets = valueMap["diets"];

      for (var i = 0; i < diets.length; i++) {
        Diet diet = Diet.fromjson(diets[i]);
        extractedDiets.add(diet);
      }
      for (var i = 0; i < extractedDiets.length; i++) {
        extractedMeals.add(extractedDiets[i].meals);
      }
      /*  print(extractedMeals[0]![0].foods);
      //print("------------------foods---------------------");
      for (var i = 0; i < extractedMeals.length; i++) {
        for (var j = 0; j < extractedMeals[i]!.length; j++) {
          extractedFoods.add(extractedMeals[i]![j].foods);
        }
      }
      //print(extractedFoods); */
    }

    return extractedMeals;
  }

  static Future<List<List<Food>?>> getFoods({required apiToken}) async {
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

      List diets = valueMap["diets"];

      for (var i = 0; i < diets.length; i++) {
        Diet diet = Diet.fromjson(diets[i]);
        extractedDiets.add(diet);
      }
      for (var i = 0; i < extractedDiets.length; i++) {
        extractedMeals.add(extractedDiets[i].meals);
      }

      for (var i = 0; i < extractedMeals.length; i++) {
        for (var j = 0; j < extractedMeals[i]!.length; j++) {
          extractedFoods.add(extractedMeals[i]![j].foods);
        }
      }
    }

    // print(extractedFoods[0]![1].quantity);
    return extractedFoods;
  }
}

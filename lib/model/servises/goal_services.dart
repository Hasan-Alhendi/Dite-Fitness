// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../const.dart';
import '../classes/goal.dart';

class GoalServises {
  static String urlUser = Const.urlUser;
  //static String url1 = Const.ip;

  static Future<List<Goal>> getGoals({required apiToken}) async {
    List<Goal> extractedGoals = [];

    var response = await http.get(
      Uri.parse('$urlUser/get-All-Goals'),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'auth-token': '$apiToken',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      List goals = valueMap["goals"];

      for (var i = 0; i < goals.length; i++) {
        Goal goal = Goal.fromJson(goals[i]);
        extractedGoals.add(goal);
      }
    }
    return extractedGoals;
  }

  static setGoal({required apiToken, required goalId}) async {
    var response = await http.post(
      Uri.parse('$urlUser/set-goal'),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{
        //'user_id': id,
        'goal_id': goalId,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      Get.snackbar('خطأ', "تأكد من الاتصال بالانترنت");
      print(response.body);
      print('$urlUser/set-goal');
      print(response.statusCode);
      return;
    }
  }
}

import 'dart:convert';
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
    // ignore: unused_local_variable
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
    /* print('response');
    print('$urlUser/set-goal');
    print(response.statusCode);
    print(response.body); */
    // print(
    //   '_____________________________response.statusCode_____________________________');
    // print(response.statusCode);
    // print(response);
    //print('$url/set-goal');
    // print(apiToken);
    /* print('$url/$id/set-goal');
    print(api_Token);
    print(response.body);
    print(response.statusCode); */
    //if (response.statusCode == 200 || response.statusCode == 201) {
    //  Map valueMap = jsonDecode(response.body);
    // print(valueMap);

    // var user = valueMap["User"];
    // print('$baseUrl$id');

    // User s = User.fromJson(user);
    // print('$baseUrl$id');

    //return s;
    // }
  }
}

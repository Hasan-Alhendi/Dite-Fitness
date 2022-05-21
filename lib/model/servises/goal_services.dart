import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../const.dart';

class GoalServises {
  static String url = Const.urlUser;

  static setGoal({required apiToken, required goalId}) async {
    // ignore: unused_local_variable
    var response = await http.post(
      Uri.parse('$url/set-goal'),
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
    print(
        '_____________________________response.statusCode_____________________________');
    print(response.statusCode);
    print(response);
    print('$url/set-goal');
    print(apiToken);
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

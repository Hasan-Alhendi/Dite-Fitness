import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../const.dart';

class GoalServises {
  static String url = Const.urlUser;

  static setGoal({required api_Token, required id, required goal}) async {
    var response = await http.post(
      Uri.parse('$url/$id/set-goal'),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'auth-token': '$api_Token',
      },
      body: jsonEncode(<String, String>{
        //'user_id': id,
        'goal_name': goal,
      }),
    );

    print('$url/$id/set-goal');
    print(api_Token);
    print(response.body);
    print(response.statusCode);
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

  /* static var dio = Dio();
  static setGoal({required api_Token, required id, required goal}) async {
    var response = await dio.post(
      '$url/$id/set-goal',
      data: jsonEncode(<String, String>{
        //'user_id': id,
        'goal_name': goal,
      }),
    );
    print(response);
    print('$url/$id/set-goal');
    print('response');
    print(response.statusCode);
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
 */
}

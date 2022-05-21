import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../const.dart';
import '../classes/activity.dart';

class ActivitiesService {
  static String url = Const.ip;

  static List<Activity> extractedActivities = [];

  static Future<List<Activity>> getActivities({required apiToken}) async {
    var response = await http.get(
      Uri.parse('$url/get-all-activities'),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'auth-token': '$apiToken',
      },
    );

    // print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      List activities = valueMap["activities"];

      for (var i = 0; i < activities.length; i++) {
        Activity activity = Activity.fromJson(activities[i]);
        extractedActivities.add(activity);
      }
    }

    return extractedActivities;
  }

  static setActivity({required apiToken, required int activityId}) async {
    // ignore: unused_local_variable
    var response = await http.post(
      Uri.parse('$url/user/add-activity'),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{
        'activity_id': activityId,
      }),
    );
    /*  print(
        '_____________________________response.statusCode_____________________________');
    print(response.statusCode);
    print(response);
    print('$url/add-activity');
    print(apiToken); */
  }
}

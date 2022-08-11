// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../const.dart';
import '../classes/activity.dart';

class ActivitiesService {
  static String urlUser = Const.urlUser;

  static Future<List<Activity>> getActivities({required apiToken}) async {
    List<Activity> extractedActivities = [];

    var response = await http.get(
      Uri.parse('$urlUser/get-all-activities'),
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
      Uri.parse('$urlUser/add-activity'),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{
        'activity_id': activityId,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      Get.snackbar('خطأ', "تأكد من الاتصال بالانترنت");
      print(response.body);
      print('$urlUser/add-activity');
      print(response.statusCode);
      return;
    }
  }
}

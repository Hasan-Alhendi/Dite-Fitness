import '../../const.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationsServices {
  static String url = Const.urlUser;

  static setMealNotifications(
      {required apiToken,
      required firstTime,
      required secondTime,
      required thirdTime}) async {
    // ignore: unused_local_variable
    var response = await http.post(
      Uri.parse('$url/save-meal-reminder'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{
        'first_meal_time': firstTime,
        'second_meal_time': secondTime,
        'third_meal_time': thirdTime,
      }),
    );
  }

  static setDayExerciseNotifications({
    required apiToken,
    required dayList,
  }) async {
    // ignore: unused_local_variable
    var response = await http.post(
      Uri.parse('$url/save-exercise-reminder'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{
        'exercise_days': dayList,
      }),
    );
  }
}

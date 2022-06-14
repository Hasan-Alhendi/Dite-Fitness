import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../const.dart';
import '../classes/day.dart';
import '../classes/exercise.dart';
import '../classes/training_exercises.dart';

class TrainingExercisesServices {
  static String urlUser = Const.urlUser;
  static Future<List<TrainingExercises>> getTrainingExercises(
      {required apiToken}) async {
    List<TrainingExercises> extractedTrainingExercises = [];

    var response = await http.get(
      Uri.parse('$urlUser/get-all-training-exercise'),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'auth-token': '$apiToken',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      List trainingExercisesList = valueMap["training_exercises"];

      for (var i = 0; i < trainingExercisesList.length; i++) {
        TrainingExercises trainingExercises =
            TrainingExercises.fromJson(trainingExercisesList[i]);
        extractedTrainingExercises.add(trainingExercises);
      }
    }

    return extractedTrainingExercises;
  }

  static settrainingExercise(
      {required apiToken, required int trainingExerciseId}) async {
    // ignore: unused_local_variable
    var response = await http.post(
      Uri.parse('$urlUser/save-training-exercise'),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{
        'training_exercise_id': trainingExerciseId,
      }),
    );
  }

  static Future<List<Day>> getCurrentTrainingExercises(
      {required apiToken}) async {
    List<Day> extractedDays = [];

    var response = await http.get(
      Uri.parse('$urlUser/get-current-training-exercise'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      var d = valueMap["training_exercises"];
      List trainingExercisesList = d["days"];

      for (var i = 0; i < trainingExercisesList.length; i++) {
        Day trainingExercises = Day.fromJson(trainingExercisesList[i]);
        extractedDays.add(trainingExercises);
      }
    }
    return extractedDays;
  }

  static Future<List<Exercise>> getSpecificExercises(
      {required apiToken, required id}) async {
    List<Exercise> extractedDays = [];

    var response = await http.get(
      Uri.parse('$urlUser/get-day-specific-exercises/$id'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      List d = valueMap["trainning_exercise_day"];
      List trainingExercisesList = d[0]["exercises"];

      for (var i = 0; i < trainingExercisesList.length; i++) {
        Exercise trainingExercises =
            Exercise.fromJson(trainingExercisesList[i]);
        extractedDays.add(trainingExercises);
      }
    }
    return extractedDays;
  }
}

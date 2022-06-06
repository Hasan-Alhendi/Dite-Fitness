import 'dart:convert';

import '../../const.dart';
import '../classes/disease.dart';
import 'package:http/http.dart' as http;

class DiseaseService {
  static String urlUser = Const.urlUser;
  static Future<List<Disease>> getDisease({required apiToken}) async {
    List<Disease> extractedDisease = [];
    var response = await http.get(
      Uri.parse('$urlUser/get-all-health-status'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> valueMap = jsonDecode(response.body);

      List diseases = valueMap["healthStatus"];

      for (var i = 0; i < diseases.length; i++) {
        Disease disease = Disease.fromJson(diseases[i]);
        extractedDisease.add(disease);
      }
    }

    return extractedDisease;
  }

  static setDiseases({required apiToken, required List<int> diseaseId}) async {
    // ignore: unused_local_variable
    var response = await http.post(
      Uri.parse('$urlUser/add-health-status'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{
        'health_status': diseaseId,
      }),
    );
  }
}
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../const.dart';

class InfoServises {
  static String url = Const.urlUser;

  static updateInfo({
    required apiToken,
    required firstName,
    required lastName,
    required gender,
    required birthDate,
    required height,
    required weight,
  }) async {
    // ignore: unused_local_variable
    var response = await http.put(
      Uri.parse('$url/add-personal-information'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{
        'first_name': firstName,
        'last_name': lastName,
        'gender': gender,
        'birth_date': birthDate,
        'height': height,
        'weight': weight
      }),
    );
  }

  static updateWeight({
    required apiToken,
    required weight,
  }) async {
    var response = await http.post(
      Uri.parse('$url/add-weight'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{'weight': weight}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.back();
      Get.snackbar(
        'شكرا لك',
        'تم تعديل الوزن بنجاح',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

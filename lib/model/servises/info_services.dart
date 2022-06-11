import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../const.dart';
import '../../theme.dart';
import '../../view/widget/next_button.dart';
import '../classes/assesement.dart';

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
      Uri.parse('$url/diet-assesement'),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{'new_weight': weight}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var valueMap = jsonDecode(response.body);
      var ass = valueMap["assesement"];
      Assesement assesement = Assesement.fromJson(ass);

      //Get.back();
      Get.defaultDialog(
        backgroundColor: container,
        title: 'المعلومات المتعلقة بالمستخدم',
        content: Column(
          children: [
            Text(assesement.oldWeightValue.toString() + " :الوزن القديم"),
            Text(assesement.newWeightValue.toString() + " :الوزن الجديد"),
            Text("%" + assesement.rank.toString() + " :نسبة الاستفادة"),
          ],
        ),
        confirm: nextButton(
            label: 'تم',
            onPressed: () {
              Get.back();
            }),
      );
    }

    Get.snackbar(
      'شكرا لك',
      'تم تعديل الوزن بنجاح',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /* static updateWeight({
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
  } */
}

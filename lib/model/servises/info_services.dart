import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../classes/user_model.dart';

class InfoServises {
  static String baseUrl =
      'http://192.168.1.2:8000/api/user/personal-information/';

  static updateInfo(
      {required api_Token,
      required id,
      required first_name,
      required last_name,
      required gender,
      required birth_date,
      required height}) async {
    var response = await http.put(
      Uri.parse('$baseUrl$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $api_Token',
      },
      body: jsonEncode(<String, dynamic>{
        'first_name': first_name,
        'last_name': last_name,
        'gender': gender,
        'birth_date': birth_date,
        'height': height,
      }),
    );
    print('response');
    print('$baseUrl$id');
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      //  Map valueMap = jsonDecode(response.body);
      // print(valueMap);

      // var user = valueMap["User"];
      // print('$baseUrl$id');

      // User s = User.fromJson(user);
      // print('$baseUrl$id');

      //return s;
    }
  }
}

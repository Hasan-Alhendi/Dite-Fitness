import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../const.dart';

class InfoServises {
  static String url = Const.urlUser;

  static updateInfo(
      {required api_Token,
      required id,
      required first_name,
      required last_name,
      required gender,
      required birth_date,
      required height}) async {
    var response = await http.put(
      Uri.parse('$url/$id/add-personal-information'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'auth-token': '$api_Token',
      },
      body: jsonEncode(<String, dynamic>{
        'first_name': first_name,
        'last_name': last_name,
        'gender': gender,
        'birth_date': birth_date,
        'height': height,
        'wieght': 22
      }),
    );

    print('response');
    print('$url/$id/add-personal-information');
    print(response.statusCode);
    // if (response.statusCode == 200 || response.statusCode == 201) {
    //  Map valueMap = jsonDecode(response.body);
    // print(valueMap);

    // var user = valueMap["User"];
    // print('$baseUrl$id');

    // User s = User.fromJson(user);
    // print('$baseUrl$id');

    //return s;
    //}
  }
}

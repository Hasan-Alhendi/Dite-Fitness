import 'dart:convert';

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

    /*  print('response');
    print('$url/add-personal-information');
    print(response.statusCode);
    print(response.body); */
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

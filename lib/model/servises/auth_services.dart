// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../const.dart';
import '../classes/user_model.dart';

/* class AuthServices {
  static String url = 'http://192.168.1.2:8000/api/user';
  static http.Client client = http.Client();

  /* static register({required email, required password}) async {
    var response = await client.post(
      Uri.parse(url),
      headers: {'': ''},
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, String> ss = response.body as Map<String, String>;
      UserModel user = UserModel.fromJson(ss);
      return user;
    }
  }
 */
  static login({required email, required password}) async {
    var response = await Dio().post(
      "$url/login",
      data: {'email': email, 'password': password},
    );
    //print(email + "   hhhh    " + password);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, String> ss = response.data as Map<String, String>;
      UserModel user = UserModel.fromJson(ss);
      return user;
    }
  }
}
 */
class AuthServices {
  static String url = Const.urlUser;
  static http.Client client = http.Client();

  static register(
      {required email, required password, required confirmPassword}) async {
    /* var response = */ await client.post(
      Uri.parse("$url/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      }),
    );

    /*  if (response.statusCode == 200 || response.statusCode == 201) {
      Map valueMap = jsonDecode(response.body);
      //var user = valueMap["User"];
      // User s = User.fromJson(user);
      //return s;
    } */
  }

  static login({required email, required password}) async {
    var response = await client.post(
      Uri.parse('$url/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map valueMap = jsonDecode(response.body);
      var user = valueMap["User"];
      if (user != null) {
        User s = User.fromJson(user);
        return s;
      } else {
        Get.snackbar('خطأ', "اسم المستخدم أو كلمة المرور غير صالحة");
      }
    }
  }

  static logOUt({required apiToken}) async {
    var response = await client.post(
      Uri.parse("$url/logout"),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'auth-token': '$apiToken',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {}
  }

  static storToken({required apiToken}) async {
    var devToken = await FirebaseMessaging.instance.getToken();
    var response = await client.post(
      Uri.parse("$url/store-token"),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'auth-token': '$apiToken',
      },
      body: jsonEncode(<String, dynamic>{'token': devToken}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      print(response.body);
      print(response.body);
      print(response.body);
      print(response.body);
      print(response.body);
      print(response.body);
    }
  }
}

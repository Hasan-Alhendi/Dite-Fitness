import 'dart:convert';

import 'package:http/http.dart' as http;
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
  static String url = 'http://192.168.1.102:8000/api/user/login';
  static http.Client client = http.Client();

  static register({required email, required password}) async {
    var response = await client.post(
      Uri.parse("$url/login"),
      headers: {'': ''},
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, String> ss = response.body as Map<String, String>;
      UserModel user = UserModel.fromJson(ss);
      return user;
    }
  }

  static login({required email, required password}) async {
    // print(email + "   hhhh    " + password);
    var response = await client.post(
      Uri.parse(url),
      //headers: {'Content-type': 'application/json'},
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    print(jsonEncode(<String, String>{'email': email, 'password': password}));
    print(response.statusCode);
    //print(email + "   hhhh    " + password);
    // print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map valueMap = jsonDecode(response.body);
      var user = valueMap["User"];
      User s = User.fromJson(user);
      print(s);
      print("-------------------------------------------------");
      //UserModel user = UserModel.fromJson(ss);
      return s;
    }
  }
}
 


/* class ApiClient {
  static final Dio _dio = Dio();

  //...
  static Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'http://192.168.1.102:8000/api/user/login',
        data: {'email': email, 'password': password},
        // queryParameters: {'apikey': 'YOUR_API_KEY'},
      );
      print('returns the successful user data json object');
      return response.data;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }
}
 */
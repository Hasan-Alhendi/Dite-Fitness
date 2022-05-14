import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      getPages: Routes.routes,
      theme: ThemeData(
        brightness: Brightness.dark,
        // primaryColor: Colors.teal,
        // backgroundColor: Colors.teal,
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'control/bindings/binding.dart';

import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    FirebaseMessaging.instance.getToken().then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    //   Get.put(LoginController());
    //   Get.put(InfoController());

    // return GetBuilder<LoginController>(builder: (_) {
    // return GetBuilder<InfoController>(builder: (_) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      initialRoute: Routes.splash,
      getPages: Routes.routes,
      theme: ThemeData(
        brightness: Brightness.dark,
        // primaryColor: Colors.teal,
        // backgroundColor: Colors.teal,
      ),
    );
    //   });
    //});
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routes.dart';

Future<void> main() async {
  await GetStorage.init();
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
  final storage = const FlutterSecureStorage();
  String? token = '';
  void d() async {
    token = await storage.read(key: 'token');
  }

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    FirebaseMessaging.instance.getToken().then((value) => print(value));
    d();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (token != '' && token != null) ? Routes.diet : Routes.login,
      getPages: Routes.routes,
      theme: ThemeData(
        brightness: Brightness.dark,
        // primaryColor: Colors.teal,
        // backgroundColor: Colors.teal,
      ),
    );
  }
}

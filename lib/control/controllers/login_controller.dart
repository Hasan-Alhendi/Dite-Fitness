import 'package:dite_fitness/model/classes/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../model/servises/auth_services.dart';
import '../../routes.dart';

class LoginController extends GetxController {
  var isLoding = false.obs;
  var obscureText = true.obs;
  var iconPassword = const Icon(Icons.visibility).obs;
  Rx<User> userInfo = User(
          id: null,
          email: null,
          firstName: null,
          lastName: null,
          gender: null,
          birthDate: null,
          height: null,
          apiToken: null)
      .obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passowrdController;
  String email = '', password = '';
  final storage = const FlutterSecureStorage();
  @override
  void onInit() {
    emailController = TextEditingController();
    passowrdController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passowrdController.dispose();
    super.dispose();
  }

  /* String? validateEmail(String emailInput) {
    if (!GetUtils.isEmail(emailInput)) {
      return "ايميل غير صالح";
    } else {
      return null;
    }
  } */

  /* String? validatePassword(String passwordInput) {
    if (passwordInput.length < 5) {
      return "كلمة المرور ضعيفة";
    } else {
      return null;
    }
  } */
  doLogOut() async {
    await storage.deleteAll();
    Get.offAndToNamed(Routes.login);
  }

  doLogin() async {
    bool isValidate = loginFormKey.currentState!.validate();
    if (isValidate) {
      isLoding.value = true;
      try {
        User? data = await AuthServices.login(
            email: emailController.text, password: passowrdController.text);

        if (data != null) {
          await storage.write(key: 'token', value: data.apiToken);
          loginFormKey.currentState!.save();
          userInfo.value = data;
          String? route = await storage.read(key: 'route');
          switch (route) {
            case 'food':
              route = Routes.bottomBar;
              break;
            case 'activity':
              route = Routes.unlikeFood;
              break;
            case 'goal':
              route = Routes.activity;

              break;
            case 'disease':
              route = Routes.goal;
              break;
            case 'info':
              route = Routes.disease;
              break;
            default:
              route = Routes.info;
              break;
          }

          /*route*/ /*Routes.info*/
          Get.offNamed(Routes.info);
        } else {
          Get.snackbar('login', 'this is problem');
        }
      } finally {
        isLoding(false);
      }
    }
  }
}

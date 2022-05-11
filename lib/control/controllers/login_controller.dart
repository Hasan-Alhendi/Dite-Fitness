import 'package:dite_fitness/model/classes/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../model/servises/auth_services.dart';
import '../../routes.dart';

class LoginController extends GetxController {
  var isLoding = false.obs;
  var obscureText = true.obs;
  var iconPassword = Icon(Icons.visibility).obs;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      emailController,
      passowrdController;
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

  doLogin() async {
    bool isValidate = loginFormKey.currentState!.validate();
    if (isValidate) {
      isLoding.value = true; //  isLoding(true);
      try {
        User data = await AuthServices.login(
            email: emailController.text, password: passowrdController.text);

        if (data != null) {
          await storage.write(key: 'token', value: data.token);
          print(data.token);
          loginFormKey.currentState!.save();
          //TODO bottomBar
          Get.toNamed(Routes.login);
        } else {
          Get.snackbar('login', 'this is problem');
        }
      } finally {
        isLoding(false);
      }
    }
  }
}

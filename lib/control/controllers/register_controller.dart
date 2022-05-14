import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../model/classes/user_model.dart';
import '../../model/servises/auth_services.dart';
import '../../routes.dart';

class RegisterController extends GetxController {
  var isLoding = false.obs;
  var obscureText = true.obs;
  var iconPassword = Icon(Icons.visibility).obs;

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,
      passowrdController,
      confirmPasswordController;
  String email = '', password = '', confirmPassword = '';
  final storage = const FlutterSecureStorage();
  @override
  void onInit() {
    emailController = TextEditingController();
    passowrdController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passowrdController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? validateEmail(String emailInput) {
    if (!GetUtils.isEmail(emailInput)) {
      return "هذا الايميل غير صحيح";
    } else {
      return null;
    }
  }

  String? validatePassword(String passwordInput) {
    if (passwordInput.length < 5) {
      return "كلمة المرور ضعيفة";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String passwordInput) {
    if (passwordInput != passowrdController.text) {
      return "كلمة المرور غير متطابقة";
    } else {
      return null;
    }
  }

  doRegister() async {
    bool isValidate = registerFormKey.currentState!.validate();
    if (isValidate) {
      isLoding.value = true; //  isLoding(true);
      try {
        User data = await AuthServices.register(
          email: emailController.text,
          password: passowrdController.text,
          confirmPassword: confirmPasswordController.text,
        );
        print(email + "      " + password + "    " + confirmPassword);
        if (data != null) {
          await storage.write(key: 'token', value: data.api_Token);

          registerFormKey.currentState!.save();
//TODO bottombar
          Get.toNamed(Routes.register);
        } else {
          Get.snackbar('regiser', 'this is problem');
        }
      } finally {
        isLoding(false);
      }
    }
  }
}

//import 'package:dite_fitness/control/controllers/info_controller.dart';
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
          apiToken: null,
          weight: null)
      .obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>(debugLabel: 'login');
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
    const token = FlutterSecureStorage();
    String? apiToken = await token.read(key: 'token');
    await AuthServices.logOUt(apiToken: apiToken);
    await storage.deleteAll();
    // infoController.isAddInfo.value = false;
    // Get.delete<LoginController>();
    //Get.delete();
    Get.deleteAll();

    Get.offNamed(Routes.splash);
  }

  //var xd = Get.put(InfoController());
  //InfoController infoController = Get.find();

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
          var apiToken = await storage.read(key: 'token');
          AuthServices.storToken(apiToken: apiToken);
          data.firstName != null
              ? {
                  // infoController.isAddInfo.value = true,
                  //   infoController.user.value.firstName = data.firstName,
                  //   infoController.user.value.lastName = data.lastName,
                  //   infoController.user.value.gender = data.gender,
                  //   infoController.user.value.height = data.height,
                  //   infoController.user.value.weight = data.weight,
                  //   infoController.user.value.birthDate = data.birthDate,
                  //   infoController.initialInfo(),
                  Get.offNamed(Routes.bottomBar),
                  // infoController.getUserInfo(),
                }
              : {
                  Get.offNamed(Routes.info),
                };
        } else {
          Get.snackbar('login', 'this is problem');
        }
      } finally {
        isLoding(false);
      }
    }
  }
}

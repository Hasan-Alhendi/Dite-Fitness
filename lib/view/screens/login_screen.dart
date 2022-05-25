import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/login_controller.dart';
import '../../routes.dart';
import '../../theme.dart';
import '../widget/back_container.dart';
import '../widget/text_form_field.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: solidBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
          child: Form(
            key: controller.loginFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'اسم التطبيق هنا',
                    style: headingStyle,
                  ),
                  SizedBox(
                    height:
                        (mq.size.height - mq.padding.top - mq.padding.bottom) *
                            0.02,
                  ),
                  backContainer(
                    height:
                        (mq.size.height - mq.padding.top - mq.padding.bottom) *
                            0.65,
                    child: LayoutBuilder(builder: (ctx, constraints) {
                      var spaceBettween = (constraints.maxHeight - 40) * 0.06;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  'تسجيل الدخول',
                                  style: headingStyle,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: spaceBettween,
                            ),
                            customTextFormField(
                              controller: controller.emailController,
                              onSaved: (value) => controller.email = value!,
                              validator:
                                  null /* (emailInput) =>
                                  controller.validateEmail(emailInput!) */
                              ,
                              hintText: 'الرجاء إدخال البريد الالكتروني',
                              labelText: 'البريد الالكتروني',
                              prefixIcon: null,
                              suffixIcon: null,
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              width: 350,
                            ),
                            SizedBox(
                              height: spaceBettween,
                            ),
                            Obx(
                              () => customTextFormField(
                                controller: controller.passowrdController,
                                onSaved: (value) =>
                                    controller.password = value!,
                                validator:
                                    null /* (passwordInput) =>
                                    controller.validatePassword(passwordInput!) */
                                ,
                                hintText: 'الرجاء إدخال كلمة المرر',
                                labelText: 'كلمة المرور',
                                prefixIcon: const Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.obscureText.value =
                                          !controller.obscureText.value;

                                      controller.obscureText.value
                                          ? controller.iconPassword.value =
                                              const Icon(Icons.visibility)
                                          : controller.iconPassword.value =
                                              const Icon(Icons.visibility_off);
                                    },
                                    icon: controller.iconPassword.value),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: controller.obscureText.value,
                                width: 350,
                              ),
                            ),
                            SizedBox(
                              height: spaceBettween,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                  onPressed: null,
                                  child: Text(
                                    'نسيت كلمة المرور',
                                    style:
                                        body2Style.copyWith(color: Colors.blue),
                                  )),
                            ),
                            SizedBox(
                              height: spaceBettween / 2,
                            ),
                            Obx(() => controller.isLoding.value == true
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : const Text('')),
                            SizedBox(
                              height: spaceBettween / 2,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      buttonAndSelectedItem),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(10)),
                                ),
                                onPressed: () {
                                  controller.doLogin();
                                },
                                child: Text(
                                  "تسجيل الدخول",
                                  style: buttonStyle,
                                ))
                          ],
                        ),
                      );
                    }),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'تسجيل الدخول بواسطة',
                      style: body2Style,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_"G"_Logo.svg/2048px-Google_"G"_Logo.svg.png',
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover),
                      Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Facebook_icon_2013.svg/1024px-Facebook_icon_2013.svg.png',
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover),
                    ],
                  ),
                  Text(
                    'ليس لدي حساب؟',
                    style: body2Style,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offNamed(Routes.register);
                    },
                    child: Text(
                      'إنشاء حساب',
                      style: body2Style.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

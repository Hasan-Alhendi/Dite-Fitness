import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/register_controller.dart';
import '../../routes.dart';
import '../../theme.dart';
import '../widget/back_container.dart';
import '../widget/text_form_field.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

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
            key: controller.registerFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Diet Fitness',
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
                            0.62,
                    child: LayoutBuilder(builder: (ctx, constraints) {
                      var spaceBettween = (constraints.maxHeight - 40) * 0.06;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text(
                                  'انشاء حساب جديد',
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
                              validator: (emailInput) =>
                                  controller.validateEmail(emailInput!),
                              hintText: 'الرجاء إدخال البريد الالكتروني',
                              labelText: 'البريد الالكتروني',
                              prefixIcon: const Icon(
                                Icons.email,
                              ),
                              suffixIcon: null,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
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
                                validator: (passwordInput) =>
                                    controller.validatePassword(passwordInput!),
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
                            Obx(
                              () => customTextFormField(
                                controller:
                                    controller.confirmPasswordController,
                                onSaved: (value) =>
                                    controller.confirmPassword = value!,
                                validator: (passwordInput) => controller
                                    .validateConfirmPassword(passwordInput!),
                                hintText: 'الرجاء تأكيد كلمة المرر',
                                labelText: 'تأكيد كلمة المرور',
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
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      buttonAndSelectedItem),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(10)),
                                ),
                                onPressed: () {
                                  controller.doRegister();
                                },
                                child: Text(
                                  "انشاء حساب",
                                  style: buttonStyle,
                                ))
                          ],
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 10),
                  /*    Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'إنشاء حساب بواسطة',
                      style: body2Style,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/google.png',
                          width: 48, height: 48, fit: BoxFit.cover),
                      Image.asset('assets/facebook.png',
                          width: 48, height: 48, fit: BoxFit.cover),
                    ],
                  ),
 */
                  const SizedBox(height: 10),
                  Text(
                    'لدي حساب بالفعل',
                    style: body2Style,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offNamed(Routes.login);
                    },
                    child: Text(
                      'تسجيل الدخول',
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

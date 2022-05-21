import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/goal_controller.dart';
import '../../routes.dart';
import '../../theme.dart';
import '../widget/back_container.dart';
import '../widget/back_button.dart';
import '../widget/custom_radio.dart';
import '../widget/next_button.dart';

class GoalScreen extends GetView<GoalController> {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    var culomnSpace = 20.0;
    return Scaffold(
      backgroundColor: solidBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'الرجاء تحديد الهدف',
                  textDirection: TextDirection.rtl,
                  style: headingStyle,
                ),
                backContainer(
                  height:
                      (mq.size.height - mq.padding.top - mq.padding.bottom) *
                          0.75,
                  child: Column(
                    children: [
                      Obx(
                        () => customRadio(
                          label: 'زيادة الوزن',
                          index: 1,
                          color: controller.selectedIndex.value == 1
                              ? buttonAndSelectedItem
                              : textFormFiled,
                          onPressed: () {
                            controller.selectedIndex.value = 1;
                          },
                        ),
                      ),
                      SizedBox(
                        height: culomnSpace,
                      ),
                      Obx(
                        () => customRadio(
                          label: 'نقصان الوزن',
                          index: 2,
                          color: controller.selectedIndex.value == 2
                              ? buttonAndSelectedItem
                              : textFormFiled,
                          onPressed: () {
                            controller.selectedIndex.value = 2;
                          },
                        ),
                      ),
                      SizedBox(
                        height: culomnSpace,
                      ),
                      Obx(
                        () => customRadio(
                          label: 'الحفاظ على الوزن',
                          index: 3,
                          color: controller.selectedIndex.value == 3
                              ? buttonAndSelectedItem
                              : textFormFiled,
                          onPressed: () {
                            controller.selectedIndex.value = 3;
                          },
                        ),
                      ),
                      SizedBox(
                        height: culomnSpace,
                      ),
                      SizedBox(
                        height: culomnSpace,
                      ),
                      SizedBox(
                        height: culomnSpace,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          nextButton(
                              label: "التالي",
                              onPressed: () {
                                controller.selectedIndex.value == 0
                                    ? Get.snackbar(
                                        'خطأ',
                                        'الرجاء تحديد الهدف',
                                        snackPosition: SnackPosition.BOTTOM,
                                      )
                                    : controller.setGoal(
                                        goalId: controller.selectedIndex.value);
                              }),
                          backButton(onPressed: () {
                            Get.toNamed(Routes.activity);
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/goal_controller.dart';
import '../../routes.dart';
import '../../theme.dart';
import '../widget/backContainer.dart';
import '../widget/backbutton.dart';
import '../widget/customRadio.dart';
import '../widget/nextbutton.dart';

class GoalScreen extends GetView<GoalController> {
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    var culomnSpace = 20.0;
    return Scaffold(
      backgroundColor: solidBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'الرجاء ادخال المعلومات الشخصية التالية:',
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
                                controller.setGoal();
                              }),
                          backButton(onPressed: () {
                            Get.toNamed(Routes.info);
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

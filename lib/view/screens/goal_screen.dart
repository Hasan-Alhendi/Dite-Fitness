import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/goal_controller.dart';
import '../../theme.dart';
import '../widget/appbar.dart';
import '../widget/back_container.dart';
import '../widget/custom_radio.dart';
import '../widget/next_button.dart';

class GoalScreen extends GetView<GoalController> {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    //var culomnSpace = 20.0;
    return Scaffold(
      appBar: customAppBar(
        title: 'تحديد الهدف',
      ),
      backgroundColor: solidBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                backContainer(
                  height:
                      (mq.size.height - mq.padding.top - mq.padding.bottom) *
                          0.85,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        Obx(
                          () => (controller.goals.isEmpty
                              ? Text(
                                  '',
                                  textAlign: TextAlign.center,
                                  style: bodyStyle,
                                )
                              : Text(
                                  "بعد تحليل البيانات المدخلة يقترح عليك النظام اختيار: " +
                                      controller
                                          .goals[controller.goals.length - 1]
                                          .goalName!,
                                  textAlign: TextAlign.center,
                                  style: bodyStyle,
                                )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Obx(
                            () {
                              if (controller.isLoading.value) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return (controller.goals.isEmpty
                                    ? Text(
                                        'الرجاء ادخال البيانات بشكل صحيح',
                                        textAlign: TextAlign.center,
                                        style: bodyStyle,
                                      )
                                    : ListView.builder(
                                        itemCount: controller.goals.length - 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Obx(
                                            () {
                                              return Column(
                                                children: [
                                                  customRadio(
                                                      color: controller
                                                                  .selectedIndex
                                                                  .value ==
                                                              controller
                                                                  .goals[index]
                                                                  .goalId
                                                          ? buttonAndSelectedItem
                                                          : textFormFiled,
                                                      index: controller
                                                          .goals[index].goalId!,
                                                      label: controller
                                                          .goals[index]
                                                          .goalName!,
                                                      onPressed: () {
                                                        controller.selectedIndex
                                                                .value =
                                                            controller
                                                                .goals[index]
                                                                .goalId!;
                                                      },
                                                      style: buttonStyle),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ));
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        nextButton(
                            label: "التالي",
                            onPressed: () {
                              controller.selectedIndex.value == 99
                                  ? Get.snackbar(
                                      'خطأ',
                                      'الرجاء تحديد الهدف',
                                      snackPosition: SnackPosition.BOTTOM,
                                    )
                                  : controller.setGoal(
                                      goalId: controller.selectedIndex.value);
                            }),
                      ],
                    ),
                  ),
                ),

                /* backContainer(
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
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}

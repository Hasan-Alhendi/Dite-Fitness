import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/activities_controller.dart';
import '../../routes.dart';
import '../../theme.dart';
import '../widget/appbar.dart';
import '../widget/back_button.dart';
import '../widget/back_container.dart';
import '../widget/custom_radio.dart';
import '../widget/next_button.dart';

class ActivitiesScreen extends GetView<ActivitiesController> {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    //var culomnSpace = 20.0;
    return Scaffold(
      appBar: customAppBar(
        title: 'درجة النشاط',
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
                    child: Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: controller.activities.length,
                                  itemBuilder:
                                      (BuildContext context, int index) => Obx(
                                    () => Column(
                                      children: [
                                        customRadio(
                                            color: controller
                                                        .selectedIndex.value ==
                                                    controller.activities[index]
                                                        .activityId
                                                ? buttonAndSelectedItem
                                                : textFormFiled,
                                            index: controller
                                                .activities[index].activityId!,
                                            label: controller.activities[index]
                                                .activityName!,
                                            label2: controller
                                                .activities[index].description!,
                                            onPressed: () {
                                              controller.selectedIndex.value =
                                                  controller.activities[index]
                                                      .activityId!;
                                            },
                                            style: buttonStyle),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  nextButton(
                                      label: "التالي",
                                      onPressed: () {
                                        controller.selectedIndex.value == 99
                                            ? Get.snackbar(
                                                'خطأ',
                                                'الرجاء تحديد درجة النشاط',
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                              )
                                            : controller.setActivity(
                                                activityId: controller
                                                    .selectedIndex.value);
                                      }),
                                  backButton(onPressed: () {
                                    Get.toNamed(Routes.goal);
                                  }),
                                ],
                              ),
                            ],
                          );
                        }
                      },
                    ),
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

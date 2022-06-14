import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/training_exercises_controller.dart';
import '../../theme.dart';
import '../widget/appbar.dart';
import '../widget/back_container.dart';
import '../widget/custom_radio.dart';
import '../widget/next_button.dart';

class TrainingExercisesScreen extends GetView<TrainingExercisesController> {
  const TrainingExercisesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    //var culomnSpace = 20.0;
    return Scaffold(
      appBar: customAppBar(
        title: 'عدد أيام اللعب',
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
                                  itemCount:
                                      controller.trainingExercisesList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) => Obx(
                                    () => Column(
                                      children: [
                                        customRadio(
                                            color: controller
                                                        .selectedIndex.value ==
                                                    controller
                                                        .trainingExercisesList[
                                                            index]
                                                        .id
                                                ? buttonAndSelectedItem
                                                : textFormFiled,
                                            index: controller
                                                .trainingExercisesList[index]
                                                .id!,
                                            label: controller
                                                .trainingExercisesList[index]
                                                .name!,
                                            label2: controller
                                                    .trainingExercisesList[
                                                        index]
                                                    .daysCount!
                                                    .toString() +
                                                " أيام",
                                            onPressed: () {
                                              controller.selectedIndex.value =
                                                  controller
                                                      .trainingExercisesList[
                                                          index]
                                                      .id!;
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
                              nextButton(
                                  label: "التالي",
                                  onPressed: () {
                                    controller.selectedIndex.value == 99
                                        ? Get.snackbar(
                                            'خطأ',
                                            'الرجاء تحديد عدد أيام اللعب',
                                            snackPosition: SnackPosition.BOTTOM,
                                          )
                                        : controller.setTrainingExercise(
                                            trainingExerciseId:
                                                controller.selectedIndex.value);
                                  }),
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

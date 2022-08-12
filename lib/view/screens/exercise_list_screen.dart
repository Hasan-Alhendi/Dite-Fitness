// ignore_for_file: avoid_print

import 'package:dite_fitness/view/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/exercise_details_controller.dart';
import '../../control/controllers/training_exercises_controller.dart';
import '../../routes.dart';
import '../../theme.dart';
import '../widget/back_container.dart';
import '../widget/next_button.dart';

class ExerciseListScreen extends GetView<TrainingExercisesController> {
  const ExerciseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    ExerciseDetailscontroller exerciseDetailscontroller = Get.find();

    return Scaffold(
      appBar: customAppBar(title: 'التمارين الرياضية'),
      backgroundColor: solidBackground,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: backContainer(
            height:
                (mq.size.height - mq.padding.top - mq.padding.bottom) * 0.85,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Stack(
                    children: [
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                          itemCount: controller.exerciseList.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  exerciseDetailscontroller.detail.value =
                                      controller
                                          .exerciseList[index].description!;
                                  print(
                                      "_____________controller.exerciseList[index].videoPath_____________");
                                  print(
                                      controller.exerciseList[index].videoPath);
                                  print(
                                      'C:/Users/Administrator/laravel/DietProject/public/Exercise/Image/${controller.exerciseList[index].exerciseImage}');
                                  print(
                                      "_____________controller.exerciseList[index].videoPath_____________");
                                  //Get.toNamed(Routes.exerciseScreen);
                                  Get.toNamed(
                                    Routes.exerciseDetailsScreen,
                                    arguments: index,
                                    /* ExerciseScreen(
                                          /* mediaUrl:
                                              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4' */
                                          /* controller.exerciseList[index].videoPath! */

                                          ),
                                      arguments: index,
                                      binding: Binding() */
                                  );
                                },
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  subtitle: Text(
                                    controller.exerciseList[index].count
                                        .toString(),
                                    style: body2Style,
                                  ),
                                  title: Text(
                                    controller.exerciseList[index].exerciseName
                                        .toString(),
                                    style: bodyStyle,
                                  ),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    child: Image.asset(
                                      'assets/Image/${controller.exerciseList[index].exerciseImage}' /* 'C:/Users/Administrator/laravel/DietProject/public/Exercise/Image/${controller.exerciseList[index].exerciseImage} '*/,
                                      width: 60,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: nextButton(
                            label: "ابدأ اللعب",
                            onPressed: () {
                              //  controller.exercisePathFun();
                              Get.toNamed(Routes.exerciseScreen);
                            }),
                      ),
                    ],
                  );
                }
              }),
            )),
      )),
    );
  }
}

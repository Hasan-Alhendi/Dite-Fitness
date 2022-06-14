import 'package:dite_fitness/view/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/training_exercises_controller.dart';
import '../../routes.dart';
import '../../theme.dart';
import '../widget/back_container.dart';

class ExerciseDayScreen extends GetView<TrainingExercisesController> {
  const ExerciseDayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);

    return Scaffold(
      appBar: customAppBar(title: 'أيام اللعب'),
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
                  return ListView.builder(
                    itemCount: controller.daysList.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.getSpecificExercises(
                                id: controller
                                    .daysList[index].trainingExerciseDayId);
                            Get.toNamed(Routes.exerciseListScreen);
                          },
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            /* subtitle: Text(
                              'dsfsfsf',
                              style: body2Style,
                            ), */
                            title: Text(
                              controller.daysList[index].dayName!,
                              style: bodyStyle,
                            ),
                            leading: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              child: Image.asset(
                                'assets/100.jpg',
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
                  );
                }
              }),
            )),
      )),
    );
  }
}

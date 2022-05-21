import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/diet_controller.dart';
import '../../routes.dart';
import '../../theme.dart';
import '../widget/back_button.dart';
import '../widget/back_container.dart';
import '../widget/next_button.dart';

class MealScreen extends GetView<DietController> {
  const MealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: solidBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'الوجبة الأولى:',
                  textDirection: TextDirection.rtl,
                  style: headingStyle,
                ),
                backContainer(
                  height:
                      (mq.size.height - mq.padding.top - mq.padding.bottom) *
                          0.75,
                  child: Stack(
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Positioned(
                          child: Obx(
                            () => ListView.builder(
                              itemCount: controller.foods[0]!.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(controller.foods[0]![index].foodName!),
                                  const Text(" "),
                                  Text(controller.foods[0]![index].quantity!
                                              .weight ==
                                          null
                                      ? ''
                                      : "الوزن:  " +
                                          controller
                                              .foods[0]![index].quantity!.weight
                                              .toString()),
                                  const Text(" "),
                                  Text(
                                    controller.foods[0]![index].quantity!
                                                .count ==
                                            null
                                        ? ''
                                        : "العدد:  " +
                                            controller.foods[0]![index]
                                                .quantity!.count
                                                .toString(),
                                  ),
                                  const Text(" "),
                                  Text(controller
                                      .foods[0]![index].quantity!.quantityStr!),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          nextButton(
                              label: "التالي",
                              onPressed: () {
                                //controller.setGoal();
                              }),
                          backButton(onPressed: () {
                            Get.toNamed(Routes.diet);
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/diet_controller.dart';
import '../../control/controllers/food_controller.dart';
import '../../theme.dart';
import '../widget/appbar.dart';
import '../widget/back_container.dart';

class MealScreen extends GetView<DietController> {
  const MealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodController foodController = Get.find();
    var mq = MediaQuery.of(context);
    return Scaffold(
      appBar: customAppBar(
        title: controller.mealName.value,
        widget: IconButton(
          onPressed: () {
            foodController.setMeal();
            /*  print(controller.meal.value.dietId);
            print(controller.meal.value.mealId);
            print(controller.meal.value.type);
            print(controller.meal.value.foods); */
          },
          icon: const Icon(
            Icons.abc,
            size: 26,
          ),
        ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Image.asset(
                          'assets/1.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(':' + controller.mealName.value, style: bodyStyle),
                      const SizedBox(
                        height: 10,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Obx(
                          () {
                            if (controller.isLoadingMeal.value) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount:
                                      controller.meal.value.foods!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) => Row(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          controller.meal.value.foods![index]
                                                  .foodName! +
                                              " " +
                                              (controller
                                                          .meal
                                                          .value
                                                          .foods![index]
                                                          .quantity!
                                                          .weight ==
                                                      null
                                                  ? ''
                                                  : "الوزن:  " +
                                                      controller
                                                          .meal
                                                          .value
                                                          .foods![index]
                                                          .quantity!
                                                          .weight
                                                          .toString()) +
                                              " " +
                                              (controller
                                                          .meal
                                                          .value
                                                          .foods![index]
                                                          .quantity!
                                                          .count ==
                                                      null
                                                  ? ''
                                                  : "العدد:  " +
                                                      controller
                                                          .meal
                                                          .value
                                                          .foods![index]
                                                          .quantity!
                                                          .count
                                                          .toString()) +
                                              " " +
                                              (controller
                                                          .meal
                                                          .value
                                                          .foods![index]
                                                          .quantity!
                                                          .quantityStr ==
                                                      null
                                                  ? ""
                                                  : controller
                                                      .meal
                                                      .value
                                                      .foods![index]
                                                      .quantity!
                                                      .quantityStr!),
                                          maxLines: 5,
                                          style: body2Style,
                                        ),
                                      ),
                                      /*  Text(
                                                controller.meal.value.foods![index]
                                                    .foodName!,
                                                //overflow: text,
                                                maxLines: 1, style: text1,
                                              ),
                                              const Text(" "),
                                              Text(
                                                controller.meal.value.foods![index]
                                                            .quantity!.weight ==
                                                        null
                                                    ? ''
                                                    : "الوزن:  " +
                                                        controller
                                                            .meal
                                                            .value
                                                            .foods![index]
                                                            .quantity!
                                                            .weight
                                                            .toString(),
                                                // overflow: text,
                                                maxLines: 1, style: text1,
                                              ),
                                              const Text(" "),
                                              Text(
                                                controller.meal.value.foods![index]
                                                            .quantity!.count ==
                                                        null
                                                    ? ''
                                                    : "العدد:  " +
                                                        controller
                                                            .meal
                                                            .value
                                                            .foods![index]
                                                            .quantity!
                                                            .count
                                                            .toString(),
                                                // overflow: text,
                                                maxLines: 1, style: text1,
                                              ),
                                              const Text(" "),
                                              Text(
                                                controller.meal.value.foods![index]
                                                    .quantity!.quantityStr!,
                                                // overflow: text,
                                                maxLines: 1, style: text1,
                                              ), */
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
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

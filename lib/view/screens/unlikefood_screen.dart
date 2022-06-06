import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/food_controller.dart';
import '../../routes.dart';
import '../../theme.dart';
import '../widget/appbar.dart';
import '../widget/back_button.dart';
import '../widget/custom_radio.dart';
import '../widget/next_button.dart';
import '../widget/search_widget.dart';

class UnlikeFoodScreen extends GetView<FoodController> {
  const UnlikeFoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: solidBackground,
      appBar: customAppBar(title: 'الأطعمة الغير مرغوب بها'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            TextFieldSearch(
              onChanged: (String query) {
                // controller.searchFood(query);
              },
              textEditingController: controller.searchController,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GridView.builder(
                      itemCount: controller.foods.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (BuildContext context, int index) => Obx(
                          () => customRadio(
                              label: controller.foods[index].foodName!,
                              index: index,
                              color: controller.unlikeFoodsList
                                      .contains(controller.foods[index].foodId)
                                  ? buttonAndSelectedItem
                                  : textButtonColor,
                              onPressed: () {
                                controller.unlikeFoodsList.contains(
                                        controller.foods[index].foodId)
                                    ? controller.unlikeFoodsList
                                        .remove(controller.foods[index].foodId!)
                                    : controller.unlikeFoodsList
                                        .add(controller.foods[index].foodId!);
                              },
                              circular: 10,
                              style: button2Style)),
                    ),
                  ),
                );
              }
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                nextButton(
                    label: "التالي",
                    onPressed: () {
                      controller.setUnlikeFoods(
                        foodsId: controller.unlikeFoodsList,
                      );
                    }),
                backButton(onPressed: () {
                  Get.toNamed(Routes.activity);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

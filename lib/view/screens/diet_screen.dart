import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/diet_controller.dart';
import '../../model/servises/diet_services.dart';
import '../../routes.dart';
import '../../theme.dart';
import '../widget/appbar.dart';
import '../widget/back_container.dart';
import '../widget/elevated_button.dart';
import '../widget/pie_chart_section.dart';

class DietScreen extends GetView<DietController> {
  const DietScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return Scaffold(
      drawer: const Drawer(),
      appBar: customAppBar(
        title: 'النظام الغذائي',
        widget: IconButton(
          onPressed: () {
            controller.diteIndex.value != DietServices.diets.length - 1
                ? controller.diteIndex.value++
                : controller.diteIndex.value = 0;
          },
          icon: const Icon(
            Icons.swap_horiz_sharp,
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
                          0.75,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 160,
                        width: 160,
                        child: PieChart(
                          PieChartData(
                            sections: getSections(),
                            centerSpaceRadius: 45,
                            sectionsSpace: 0,
                            startDegreeOffset: 0,
                            borderData: FlBorderData(
                              show: false,
                              border: Border.all(color: Colors.white),
                            ),
                            //centerSpaceColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Obx(
                          () {
                            if (controller.isLoading.value) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              return Expanded(
                                child: GridView.builder(
                                  itemCount: controller.diet.value.meals == null
                                      ? 4
                                      : controller.diet.value.meals!.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 3 / 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    int? x = controller
                                        .diet.value.meals![index].type;
                                    var mealName = '';
                                    switch (x) {
                                      case 1:
                                        mealName = 'الوجبة الأولى';
                                        break;
                                      case 2:
                                        mealName = 'الوجبة الثانية';
                                        break;
                                      case 3:
                                        mealName = 'الوجبة الثالثة';
                                        break;
                                      case 4:
                                        mealName = 'الوجبة الرابعة';
                                        break;
                                    }
                                    return elevatedButton(
                                        width: 150,
                                        height: 30,
                                        circular: 10,
                                        style: buttonStyle,
                                        color: buttonAndSelectedItem,
                                        label: mealName,
                                        onPressed: () {
                                          controller.getMeal(
                                              dietIndex:
                                                  controller.diteIndex.value,
                                              mealIndex: index);
                                          controller.mealName.value = mealName;
                                          Get.toNamed(Routes.meal);
                                        });
                                  },
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

/* class DietScreen extends GetView<DietController> {
  const DietScreen({Key? key}) : super(key: key);

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
                  'النظام الغذائي:',
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
 */
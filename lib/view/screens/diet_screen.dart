import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/diet_controller.dart';
import '../../control/controllers/info_controller.dart';
import '../../model/servises/diet_services.dart';
import '../../routes.dart';
import '../../theme.dart';
import '../widget/appbar.dart';
import '../widget/back_container.dart';
import '../widget/drawer.dart';
import '../widget/elevated_button.dart';
import '../widget/next_button.dart';
import '../widget/pie_chart_section.dart';
import '../widget/text_form_field.dart';

// ignore: must_be_immutable
class DietScreen extends GetView<DietController> {
  DietScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return Scaffold(
      drawer: const MyDrawers(),
      appBar: customAppBar(
        title: 'النظام الغذائي',
        widget: Obx(() {
          if (controller.listDiet.isEmpty) {
            return const SizedBox();
          } else {
            return Obx(() {
              if (controller.dietStatus.value != 2) {
                return const SizedBox();
              } else {
                return IconButton(
                  onPressed: () {
                    controller.diteIndex.value != DietServices.diets.length - 1
                        ? controller.diteIndex.value++
                        : controller.diteIndex.value = 0;
                    controller.getDiet(index: controller.diteIndex.value);
                  },
                  icon: const Icon(
                    Icons.swap_horiz_sharp,
                    size: 26,
                  ),
                );
              }
            });
          }
        }),
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
                  child: Obx(
                    () {
                      if (controller.dietStatus.value == 0) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'هذا النظام لم يعد صالح الرجاء ادخال الوزن الجديد',
                              style: bodyStyle,
                              textAlign: TextAlign.center,
                            ),
                            nextButton(
                                label: 'ادخال الوزن',
                                onPressed: () {
                                  showDialogBox();
                                })
                          ],
                        );
                      } else {
                        return Column(
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
                                        itemCount:
                                            controller.diet.value.meals == null
                                                ? 4
                                                : controller
                                                    .diet.value.meals!.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 3 / 1.3,
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
                                              height: 20,
                                              circular: 10,
                                              style: buttonStyle,
                                              color: buttonAndSelectedItem,
                                              label: mealName,
                                              onPressed: () {
                                                controller.getMeal(
                                                    dietIndex: controller
                                                        .diteIndex.value,
                                                    mealIndex: index);
                                                controller.mealName.value =
                                                    mealName;
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
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  if (controller.listDiet.isEmpty) {
                    return const SizedBox();
                  } else {
                    return Obx(() {
                      if (controller.dietStatus.value != 2) {
                        return const SizedBox();
                      } else {
                        return nextButton(
                            label: "تأكيد",
                            onPressed: () {
                              controller.setDiet(
                                  dietId: controller.diet.value.dietId);
                              controller.listDiet.value = [];
                            });
                      }
                    });
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InfoController infoController = Get.find();
  showDialogBox() async {
    return await Get.defaultDialog(
      backgroundColor: container,
      title: 'الرجاء إدخال الوزن الحالي',
      content: Form(
        key: infoController.informationFormKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'كغ',
              style: bodyStyle,
            ),
            const SizedBox(
              width: 20,
            ),
            customTextFormField(
              labelText: null,
              hintText: "80",
              controller: infoController.wightController,
              onSaved: null,
              keyboardType: TextInputType.number,
              width: 100,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'الوزن',
              style: bodyStyle,
            ),
          ],
        ),
      ),
      confirm: nextButton(
          label: 'تأكيد',
          onPressed: () async {
            infoController.updateWeight();
            controller.getDiet(index: controller.diteIndex.value);

            controller.dietStatus.value = 2;
            Get.back();
          }),
    );
  }

  /*  showDialogBox1() async {
    return await Get.defaultDialog(
      backgroundColor: container,
      title: 'المعلومات المتعلقة بالمستخدم',
      content: Column(
        children: [
          Text(infoController.assesment.value.oldWeightValue.toString() +
              " :الوزن القديم"),
          Text(infoController.assesment.value.newWeightValue.toString() +
              " :الوزن الجديد"),
          Text(infoController.assesment.value.rank.toString() +
              " :نسبة الاستفادة"),
        ],
      ),
      confirm: nextButton(
          label: 'تم',
          onPressed: () {
           
            Get.back();
          }),
    );
    /* return Obx(() {
      if (infoController.isLoading.value == true) {
        return const CircularProgressIndicator();
      } else {
        return n;
      }
    }); */
  } */
}

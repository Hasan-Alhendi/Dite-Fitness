import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/diseases_controller.dart';
import '../../routes.dart';
import '../../theme.dart';
import '../widget/appbar.dart';
import '../widget/back_button.dart';
import '../widget/back_container.dart';
import '../widget/custom_radio.dart';
import '../widget/next_button.dart';

class DiseaseScreen extends GetView<DiseasesController> {
  const DiseaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: solidBackground,
      appBar: customAppBar(title: 'تحديد الأمراض'),
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
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: controller.disease.length,
                                itemBuilder:
                                    (BuildContext context, int index) => Obx(
                                  () => Column(
                                    children: [
                                      customRadio(
                                          label: controller
                                              .disease[index].diseaseName!,
                                          index: index,
                                          color: controller.diseaseList
                                                  .contains(controller
                                                      .disease[index].diseaseId)
                                              ? buttonAndSelectedItem
                                              : textButtonColor,
                                          onPressed: () {
                                            controller.diseaseList.contains(
                                                    controller.disease[index]
                                                        .diseaseId)
                                                ? controller.diseaseList.remove(
                                                    controller.disease[index]
                                                        .diseaseId!)
                                                : controller.diseaseList.add(
                                                    controller.disease[index]
                                                        .diseaseId!);
                                          },
                                          style: button2Style),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                nextButton(
                                    label: "التالي",
                                    onPressed: () {
                                      controller.setDiseases(
                                        diseasesId: controller.diseaseList,
                                      );
                                    }),
                                backButton(onPressed: () {
                                  Get.toNamed(Routes.info);
                                }),
                              ],
                            ),
                          ],
                        );
                      }
                    }),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/food_controller.dart';
import '../../theme.dart';
import '../widget/appbar.dart';
import '../widget/back_container.dart';

class AlternativesScreen extends GetView<FoodController> {
  const AlternativesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodController controller = Get.find();
    var mq = MediaQuery.of(context);

    return Scaffold(
      appBar: customAppBar(
        title: 'البدائل',
      ),
      backgroundColor: solidBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: backContainer(
            height:
                (mq.size.height - mq.padding.top - mq.padding.bottom) * 0.85,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: (controller.mainFoods.isEmpty)
                  ? Center(
                      child: Text(
                        'لا يوجد بدائل لهذه الوجبة',
                        style: bodyStyle,
                      ),
                    )
                  : Obx(() {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.mainFoods.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'بدائل الـ' +
                                  controller.mainFoods[index].foodName! +
                                  ":",
                              style: bodyStyle,
                            ),
                            listBuilder(controller, index),
                            const Divider(
                              color: Colors.white,
                            ),
                          ],
                        ),
                      );
                    }),
            ), /*Column( 
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
                Text(':البدائل', style: bodyStyle),
                const SizedBox(
                  height: 10,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Obx(() {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: controller.mainFoods.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                controller.mainFoods[index].foodName! +
                                    " " +
                                    (controller.mainFoods[index].quantity!
                                                .weight ==
                                            null
                                        ? ''
                                        : "الوزن:  " +
                                            controller.mainFoods[index]
                                                .quantity!.weight
                                                .toString()) +
                                    " " +
                                    (controller.mainFoods[index].quantity!
                                                .count ==
                                            null
                                        ? ''
                                        : "العدد:  " +
                                            controller.mainFoods[index]
                                                .quantity!.count
                                                .toString()) +
                                    " " +
                                    (controller.mainFoods[index].quantity!
                                                .quantityStr ==
                                            null
                                        ? ""
                                        : controller.mainFoods[index]
                                            .quantity!.quantityStr!),
                                maxLines: 5,
                                style: body2Style,
                              ),
                            ),
                            /*  Text(
                                          controller.mainFoods[index]
                                              .foodName!,
                                          //overflow: text,
                                          maxLines: 1, style: text1,
                                        ),
                                        const Text(" "),
                                        Text(
                                          controller.mainFoods[index]
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
                                          controller.mainFoods[index]
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
                                          controller.mainFoods[index]
                                              .quantity!.quantityStr!,
                                          // overflow: text,
                                          maxLines: 1, style: text1,
                                        ), */
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ), */
          ),
        ),
      ),
    );
  }

  Widget listBuilder(FoodController controller, int index) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.alternativesFoods[index].length,
      itemBuilder: (BuildContext context1, int index1) => Flexible(
        child: Text(
          controller.alternativesFoods[index][index1].foodName! +
              " " +
              (controller.alternativesFoods[index][index1].quantity!.weight ==
                      null
                  ? ''
                  : "الوزن:  " +
                      controller
                          .alternativesFoods[index][index1].quantity!.weight
                          .toString()) +
              " " +
              (controller.alternativesFoods[index][index1].quantity!.count ==
                      null
                  ? ''
                  : "العدد:  " +
                      controller
                          .alternativesFoods[index][index1].quantity!.count
                          .toString()) +
              " " +
              (controller.alternativesFoods[index][index1].quantity!
                          .quantityStr ==
                      null
                  ? ""
                  : controller
                      .alternativesFoods[index][index1].quantity!.quantityStr!),
          maxLines: 5,
          style: body2Style,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/aim_controller.dart';
import '../../routes.dart';
import '../../theme.dart';
import '../widget/backContainer.dart';
import '../widget/backbutton.dart';
import '../widget/customRadio.dart';
import '../widget/nextbutton.dart';

class AimScreen extends GetView<AimController> {
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    var culomnSpace = 20.0;
    return Scaffold(
      backgroundColor: solidBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'الرجاء ادخال المعلومات الشخصية التالية:',
                  textDirection: TextDirection.rtl,
                  style: headingStyle,
                ),
                backContainer(
                  height:
                      (mq.size.height - mq.padding.top - mq.padding.bottom) *
                          0.75,
                  child: Column(
                    children: [
                      customRadio(label: 'زيادة الوزن'),
                      SizedBox(
                        height: culomnSpace,
                      ),
                      customRadio(label: 'نقصان الوزن'),
                      SizedBox(
                        height: culomnSpace,
                      ),
                      customRadio(label: 'الحفاظ على الوزن'),
                      SizedBox(
                        height: culomnSpace,
                      ),
                      SizedBox(
                        height: culomnSpace,
                      ),
                      SizedBox(
                        height: culomnSpace,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          nextButton(label: "التالي", onPressed: () {}),
                          backButton(onPressed: () {
                            Get.toNamed(Routes.info);
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/exercise_details_controller.dart';
import '../../theme.dart';
import '../widget/appbar.dart';

class ExerciseDetailsScreen extends GetView<ExerciseDetailscontroller> {
  const ExerciseDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'طريقة لعب التمرين',
      ),
      backgroundColor: solidBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.asset(
                        'assets/552.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Obx(() {
                        return SingleChildScrollView(
                          child: Text(
                            controller.detail.value,
                            maxLines: 20,
                            style: body2Style,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

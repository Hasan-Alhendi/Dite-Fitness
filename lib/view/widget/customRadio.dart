import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/goal_controller.dart';
import '../../theme.dart';

GoalController controller = controller = Get.find();
Widget customRadio({
  required String label,
  required int index,
  required Color color,
}) {
  return ElevatedButton(
    onPressed: () {
      controller.selectedIndex.value = index;
    },
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(Size(300, 100)),
      side: MaterialStateProperty.all(
        BorderSide(
          color: borderCard1,
          width: 2,
        ),
      ),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
      backgroundColor: MaterialStateProperty.all(color),
    ),
    child: Text(
      label,
      style: bodyStyle,
    ),
  );
}

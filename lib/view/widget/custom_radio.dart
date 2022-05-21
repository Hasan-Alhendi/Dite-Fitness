import 'package:flutter/material.dart';

import 'elevated_button.dart';

//GoalController controller1 = Get.find();
Widget customRadio(
    {required String label,
    required int index,
    required Color color,
    required Function()? onPressed}) {
  return elevatedButton(
    index: index,
    color: color,
    label: label,
    onPressed: onPressed,
  );
}

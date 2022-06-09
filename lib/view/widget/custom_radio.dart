import 'package:flutter/material.dart';

import 'elevated_button.dart';

//GoalController controller1 = Get.find();
Widget customRadio({
  required String label,
  String label2 = '',
  required int index,
  required Color color,
  required Function()? onPressed,
  double width = 300,
  double height = 100,
  double circular = 25.0,
  TextStyle? style,
}) {
  return elevatedButton(
    index: index,
    color: color,
    label: label,
    label2: label2,
    onPressed: onPressed,
    width: width,
    height: height,
    circular: circular,
    style: style,
  );
}

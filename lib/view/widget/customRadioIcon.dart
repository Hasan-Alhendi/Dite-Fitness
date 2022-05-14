import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/info_controller.dart';
import '../../theme.dart';

InfoController controller = Get.find();

Widget customRadioIcon({
  required String label,
  required IconData icon,
  required int index,
  required Color color,
}) {
  return ElevatedButton.icon(
    onPressed: () {
      controller.selectedIndex.value = index;
      print(index);
    },
    icon: Icon(
      icon,
      size: 30,
    ),
    label: Text(
      label,
      style: bodyStyle,
    ),
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(Size(150, 60)),
      side: MaterialStateProperty.all(
        BorderSide(
          color: borderCard1,
          width: 2,
        ),
      ),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
      backgroundColor: MaterialStateProperty.all(color),
    ),
  );
}

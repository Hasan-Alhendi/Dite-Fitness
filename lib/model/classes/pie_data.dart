import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/diet_controller.dart';

DietController b = Get.find();

class PieData {
  static List<Data> data = [
    Data(
        name: 'Blue',
        percent: b.diet.value.carbohydrate == null
            ? 51
            : b.diet.value.carbohydrate!.toDouble(),
        color: const Color(0xff0293ee)),
    Data(
        name: 'Orange',
        percent: b.diet.value.protien == null
            ? 16
            : b.diet.value.protien!.toDouble(),
        color: const Color(0xfff8b250)),
    Data(
        name: 'Green',
        percent: b.diet.value.fats == null ? 33 : b.diet.value.fats!.toDouble(),
        color: const Color(0xff13d38e)),
  ];
}

class Data {
  final String name;
  final double percent;
  final Color color;
  Data({
    required this.name,
    required this.percent,
    required this.color,
  });
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/diet_controller.dart';

List<PieChartSectionData> getSections(/* int touchedIndex */) => data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      //final isTouched = index == touchedIndex;
      // final double fontSize = isTouched ? 25 : 16;
      // final double radius = isTouched ? 100 : 80;

      final value = PieChartSectionData(
        borderSide: const BorderSide(color: Colors.white),
        color: data.color,
        value: data.percent,
        title: '${data.percent}%',
        radius: 55,
        titleStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Color(0xffffffff),
        ),
      );

      return MapEntry(index, value);
    })
    .values
    .toList();
DietController b = Get.find();

List<Data> data = [
  Data(
      name: 'Blue',
      percent: b.diet.value.carbohydrate == null
          ? 51
          : b.diet.value.carbohydrate!.toDouble(),
      color: const Color(0xff0293ee)),
  Data(
      name: 'Orange',
      percent:
          b.diet.value.protien == null ? 16 : b.diet.value.protien!.toDouble(),
      color: const Color(0xfff8b250)),
  Data(
      name: 'Green',
      percent: b.diet.value.fats == null ? 33 : b.diet.value.fats!.toDouble(),
      color: const Color(0xff13d38e)),
];

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

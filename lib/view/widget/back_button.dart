import 'dart:math';

import 'package:flutter/material.dart';

import '../../theme.dart';

Widget backButton({required Function()? onPressed}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
      side: MaterialStateProperty.all(const BorderSide()),
      backgroundColor: MaterialStateProperty.all(buttonAndSelectedItem),
      elevation: MaterialStateProperty.all(5),
      fixedSize: MaterialStateProperty.all(
        const Size(30, 60),
      ),
    ),
    icon: Transform.rotate(
        angle: 180 * pi / 180, child: const Icon(Icons.arrow_back)),
    label: const Text(''),
  );
}

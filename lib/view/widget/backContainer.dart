import 'package:flutter/Material.dart';

import '../../theme.dart';

Widget backContainer({required Widget child, required double height}) {
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
      color: container,
      border: Border.all(color: borderCard, width: 2),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    ),
    child: child,
  );
}

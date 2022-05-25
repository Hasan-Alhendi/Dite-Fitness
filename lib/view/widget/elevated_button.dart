import 'package:flutter/material.dart';

import '../../theme.dart';

ElevatedButton elevatedButton({
  int? index,
  required Color color,
  required String label,
  double width = 300,
  double height = 100,
  double circular = 25.0,
  required Function()? onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(Size(width, height)),
      side: MaterialStateProperty.all(
        const BorderSide(
          color: borderCard1,
          width: 2,
        ),
      ),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circular))),
      backgroundColor: MaterialStateProperty.all(color),
    ),
    child: Text(
      label,
      style: buttonStyle,
    ),
  );
}

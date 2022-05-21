import 'package:flutter/material.dart';

import '../../theme.dart';

ElevatedButton elevatedButton({
  int? index,
  required Color color,
  required String label,
  required Function()? onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(const Size(300, 100)),
      side: MaterialStateProperty.all(
        const BorderSide(
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

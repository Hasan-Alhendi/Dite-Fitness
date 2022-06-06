import 'package:flutter/material.dart';

import '../../theme.dart';

ElevatedButton elevatedButton({
  int? index,
  required Color color,
  required String label,
  String label2 = '',
  double width = 300,
  double height = 100,
  double circular = 25.0,
  TextStyle? style,
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
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: style,
        ),
        (label2 == ''
            ? const SizedBox()
            : Text(
                label2,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: button3Style,
              )),
      ],
    ),
  );
}

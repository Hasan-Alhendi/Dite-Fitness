import 'package:flutter/material.dart';

import '../../theme.dart';

Widget customRadio({
  required String label,
}) {
  return ElevatedButton(
    onPressed: () {},
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(Size(300, 100)),
      side: MaterialStateProperty.all(
        BorderSide(
          color: borderCard1,
          width: 2,
        ),
      ),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
      backgroundColor: MaterialStateProperty.all(textFormFiled),
    ),
    child: Text(
      label,
      style: bodyStyle,
    ),
  );
}

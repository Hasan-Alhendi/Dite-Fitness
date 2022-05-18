import 'package:flutter/material.dart';

import '../../theme.dart';

Widget nextButton({required String label, required Function()? onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(label, style: buttonStyle),
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
      side: MaterialStateProperty.all(BorderSide()),
      backgroundColor: MaterialStateProperty.all(buttonAndSelectedItem),
      elevation: MaterialStateProperty.all(5),
      fixedSize: MaterialStateProperty.all(
        Size(225, 60),
      ),
    ),
  );
}

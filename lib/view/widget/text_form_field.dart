import 'package:flutter/material.dart';

import '../../theme.dart';

Widget customTextFormField({
  required String? labelText,
  required String? hintText,
  String? initialvalue,
  Widget? prefixIcon,
  Widget? suffixIcon,
  required TextEditingController? controller,
  required Function(String?)? onSaved,
  String? Function(String?)? validator,
  required TextInputType? keyboardType,
  bool obscureText = false,
  double? width,
  TextAlign textAlign = TextAlign.start,
}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: SizedBox(
      width: width,
      child: TextFormField(
        initialValue: initialvalue,
        style: body2Style,
        textAlign: textAlign,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          iconColor: white,
          filled: true,
          fillColor: textFormFiled,
          labelText: labelText,
          hintText: hintText,
          hintStyle: hintStyle,
          labelStyle: const TextStyle(color: Colors.white),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: borderCard,
              width: 2.0,
            ),
          ),
        ),
      ),
    ),
  );
}

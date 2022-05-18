import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color solidBackground = Color.fromRGBO(32, 17, 52, 1);
const Color textFormFiled = Color.fromRGBO(54, 30, 115, 1);
const Color textButtonColor = Color.fromARGB(255, 41, 1, 142);
const Color container = Color.fromRGBO(51, 27, 80, 1);
const Color borderCard = Color.fromRGBO(75, 39, 118, 1);
const Color borderCard1 = Color.fromRGBO(129, 135, 253, .25);
const Color hint = Color.fromRGBO(150, 167, 175, 1);
const Color buttonAndSelectedItem = Color.fromRGBO(86, 90, 250, 1);
const Color white = Colors.white;
const Color black = Colors.black;

/* class Themes {
  static final light = ThemeData(
      primaryColor: solidBackground,
      backgroundColor: white,
      brightness: Brightness.light);
  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
 */

/* TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? white : darkGreyClr,
    ),
  );
} */

TextStyle get headingStyle {
  return GoogleFonts.sen(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: white,
    ),
  );
}

TextStyle get bodyStyle {
  return GoogleFonts.sen(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: white,
    ),
  );
}

TextStyle get hintStyle {
  return GoogleFonts.sen(
    textStyle: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: hint,
    ),
  );
}

TextStyle get body2Style {
  return GoogleFonts.sen(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: white,
    ),
  );
}

TextStyle get buttonStyle {
  return GoogleFonts.sen(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: white,
    ),
  );
}

TextStyle get rChartStyle {
  return GoogleFonts.sen(
    textStyle: const TextStyle(
      fontSize: 9,
      fontWeight: FontWeight.normal,
      color: white,
    ),
  );
}

TextStyle get bChartStyle {
  return GoogleFonts.sen(
    textStyle: const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.bold,
      color: white,
    ),
  );
}

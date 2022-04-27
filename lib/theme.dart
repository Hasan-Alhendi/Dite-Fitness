import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color solidBackground = Color(0xFF211134);
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

TextStyle get bwChartStyle {
  return GoogleFonts.sen(
    textStyle: const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.bold,
      color: white,
    ),
  );
}

TextStyle get bbChartStyle {
  return GoogleFonts.sen(
    textStyle: const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.bold,
      color: black,
    ),
  );
}

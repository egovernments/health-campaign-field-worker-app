library digit_theme;

import 'package:digit_ui_components/theme/colors.dart';
import 'package:digit_ui_components/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DigitTheme {
  static const DigitTheme _instance = DigitTheme._internal();
  static DigitTheme get instance => _instance;

  DigitColors get colors => const DigitColors();

  DigitMobileTypography get mobileTypography => DigitMobileTypography(
        normalBase: GoogleFonts.roboto(),
        displayBase: GoogleFonts.robotoCondensed(),
        light: colors.davyGray,
        normal: colors.woodsmokeBlack,
      );

  const DigitTheme._internal();

  ThemeData get mobileTheme {
    return ThemeData(textTheme: mobileTypography.textTheme);
  }
}

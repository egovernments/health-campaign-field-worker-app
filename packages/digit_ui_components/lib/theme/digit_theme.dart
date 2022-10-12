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
    const Border(top: BorderSide());

    return ThemeData(
      colorScheme: colorScheme,
      textTheme: mobileTypography.textTheme,
      appBarTheme: const AppBarTheme(elevation: 0),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: buttonBorder,
          padding: buttonPadding,
          foregroundColor: colorScheme.secondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: buttonBorder,
          padding: buttonPadding,
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
          disabledBackgroundColor: colorScheme.secondary.withOpacity(0.5),
          disabledForegroundColor: colorScheme.onSecondary,
          elevation: 0,
        ),
      ),
    );
  }

  EdgeInsets get buttonPadding => const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 24,
      );

  OutlinedBorder get buttonBorder => const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      );

  ColorScheme get colorScheme => ColorScheme(
        brightness: Brightness.light,
        primary: colors.regalBlue,
        onPrimary: colors.white,
        secondary: colors.burningOrange,
        onSecondary: colors.white,
        error: colors.lavaRed,
        onError: colors.white,
        background: colors.seaShellGray,
        onBackground: colors.woodsmokeBlack,
        surface: colors.alabasterWhite,
        onSurface: colors.woodsmokeBlack,
      );
}

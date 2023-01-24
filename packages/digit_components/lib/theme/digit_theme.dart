library digit_theme;

import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPadding = 8.0;

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
      scaffoldBackgroundColor: colorScheme.background,
      textTheme: mobileTypography.textTheme,
      appBarTheme: const AppBarTheme(elevation: 0),
      textButtonTheme: textButtonTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      cardTheme: cardTheme,
      inputDecorationTheme: inputDecorationTheme,
      dialogTheme: dialogTheme,
      outlinedButtonTheme: outlinedButtonTheme,
    );
  }

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
        onSurfaceVariant: colors.darkSpringGreen,
        tertiaryContainer: colors.tropicalBlue,
        inversePrimary: colors.paleLeafGreen,
        surfaceTint: colors.waterBlue,
      );

  EdgeInsets get buttonPadding => const EdgeInsets.symmetric(
        vertical: kPadding,
        horizontal: kPadding * 2,
      );

  EdgeInsets get containerMargin => const EdgeInsets.all(kPadding);

  OutlinedBorder get buttonBorder => const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      );

  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: buttonBorder,
          padding: buttonPadding,
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
          disabledBackgroundColor: colorScheme.secondary.withOpacity(
            0.5,
          ),
          disabledForegroundColor: colorScheme.onSecondary,
          elevation: 0,
        ),
      );

  TextButtonThemeData get textButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: buttonBorder,
          padding: buttonPadding,
          textStyle: const TextStyle(fontSize: 16),
          foregroundColor: colorScheme.secondary,
        ),
      );

  CardTheme get cardTheme => const CardTheme(
        margin: EdgeInsets.fromLTRB(kPadding, kPadding * 2, kPadding, 0),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      );

  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              0,
            ),
          ),
          borderSide: BorderSide(
            color: colors.davyGray,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              0,
            ),
          ),
          borderSide: BorderSide(
            color: colors.davyGray,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.all(12),
        isDense: true,
        isCollapsed: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      );

  DialogTheme get dialogTheme => DialogTheme(
        titleTextStyle: mobileTypography.headingL,
        contentTextStyle: mobileTypography.bodyL,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              4,
            ),
          ),
        ),
        actionsPadding: const EdgeInsets.all(kPadding),
      );

  OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: colorScheme.secondary),
          padding: buttonPadding,
        ),
      );

  BorderSide get tableCellBorder => BorderSide(
        color: colorScheme.background,
        width: 0.5,
      );
}

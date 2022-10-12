import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DigitMobileTypography {
  final Color? _textColorNormal;
  final Color? _textColorLight;

  const DigitMobileTypography({Color? normal, Color? light})
      : _textColorLight = light,
        _textColorNormal = normal;

  TextStyle get roboto {
    return GoogleFonts.roboto(color: _textColorNormal);
  }

  TextStyle get robotoLight {
    return GoogleFonts.roboto(color: _textColorLight);
  }

  TextStyle get robotoCondensed {
    return GoogleFonts.robotoCondensed(color: _textColorNormal);
  }

  TextStyle get robotoCondensedLight {
    return GoogleFonts.robotoCondensed(color: _textColorLight);
  }

  TextTheme get textTheme {
    return TextTheme(
      headlineLarge: roboto.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
      headlineMedium:
          roboto.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
      headlineSmall: roboto.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
    );
  }
}

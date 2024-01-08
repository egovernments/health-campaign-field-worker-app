import 'package:flutter/material.dart';

import '../theme/colors.dart';

class BaseConstants {

  static const double defaultHeight = 40;
  static const double defaultWidth = 328;
  static const double suffixIconSize = 20.0;
  static const double errorIconSize = 16.0;
  static const double mobileInputWidth = 328;
  static const double desktopInputWidth = 600;
  static const double inputMaxHeight = 100.0;
  static const double inputMinHeight = 40.0;
  static const double mobileInputMaxWidth = 328.0;
  static const double mobileInputMinWidth = 156.0;
  static const double desktopInputMaxWidth = 600.0;
  static const double desktopInputMinWidth = 200.0;

  static final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
        color: const DigitColors().burningOrange, width: 1.0),
    borderRadius: BorderRadius.zero,
  );

  static final OutlineInputBorder disabledBorder = OutlineInputBorder(
    borderSide: BorderSide(
        color: const DigitColors().cloudGray, width: 1.0),
    borderRadius: BorderRadius.zero,
  );


  // Spacing
  static const double defaultPadding = 12.0;

  // Colors
  static const Color hoverColor = Colors.transparent;
  static const Color splashColor = Colors.transparent;
  static const Color focusColor = Colors.transparent;
  static const Color transparentColor = Colors.transparent;
  static const Color seaShellGray = Color(0xFFF1F1F1);
  static const Color davyGray = Color(0xFF575757);
  static const Color cloudGray = Color(0xFFEDEDED);
  static const Color lavaRed = Color(0xFFD9534F);
  static const Color burningOrange = Color(0xFFD9534F);
}

import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CheckboxConstants {
  static const double iconSize = 16.0;
  static const double containerSize = 24.0;
  static const double borderWidth = 2.0;
  static const EdgeInsets defaultPadding = EdgeInsets.only(left: 4.0);

  static Color uncheckedBorderColor({required bool isDisabled, required Color? customColor}) =>
      customColor ?? (isDisabled ? const DigitColors().cloudGray : const DigitColors().davyGray);

  static Color checkedBorderColor({required bool isDisabled, required Color? customColor}) =>
      customColor ?? (isDisabled ? const DigitColors().cloudGray : const DigitColors().burningOrange);

  static Color intermediateBorderColor({required bool isDisabled, required Color? customColor}) =>
      customColor ?? (isDisabled ? const DigitColors().cloudGray : const DigitColors().burningOrange);

  static Color iconColor({required bool isDisabled, required Color? customColor}) =>
      customColor ?? (isDisabled ? const DigitColors().cloudGray : const DigitColors().burningOrange);
}

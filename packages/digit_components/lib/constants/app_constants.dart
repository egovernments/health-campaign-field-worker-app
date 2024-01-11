import 'package:flutter/material.dart';

import '../theme/colors.dart';

class Default{
  static const double height = 40;
  static const double mobileInputWidth = 328;
  static const double desktopInputWidth = 600;
}

class BaseConstants {
  static const double suffixIconSize = 20.0;
  static const double errorIconSize = 16.0;
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
}


class DigitButtonConstants {
  static const EdgeInsets defaultButtonPadding = EdgeInsets.all(8.0);
  static const EdgeInsets defaultContentPadding = EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0);
  static const double defaultIconSize = 20.0;
  static final Color defaultDisabledColor = const DigitColors().cloudGray;
  static final Color defaultPrimaryColor = const DigitColors().burningOrange;
  static final Color defaultSecondaryColor = const DigitColors().woodsmokeBlack;
  static final Color defaultTextColor = const DigitColors().white;
  static const double defaultWidth = 1.0;
  static const double defaultHoverWidth = 2.0;
}
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

class DropdownConstants {
  static const EdgeInsetsGeometry defaultPadding =
  EdgeInsets.only(left: 10, top: 16, bottom: 16);
  static const EdgeInsetsGeometry nestedItemPadding =
  EdgeInsets.only(left: 10, top: 8, bottom: 8);
  static const EdgeInsetsGeometry nestedItemHeaderPadding =EdgeInsets.all(10);
  static const double defaultProfileSize = 32;
  static const double defaultImageRadius = 72;
  static const double textIconSize = 20;
  static const EdgeInsets noItemAvailablePadding =  EdgeInsets.all(8.0);
  static const Duration animationDuration = Duration(milliseconds: 200);
}

class RadioConstant {
  static const EdgeInsets defaultPadding = EdgeInsets.all(8);
  static const double radioWidth = 24.0;
  static const double radioHeight = 24.0;
}
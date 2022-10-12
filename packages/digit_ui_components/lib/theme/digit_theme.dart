library digit_theme;

import 'package:digit_ui_components/theme/colors.dart';

class DigitTheme {
  static const DigitTheme _instance = DigitTheme._internal();
  static DigitTheme get instance => _instance;

  DigitColors get colors => DigitColors();

  const DigitTheme._internal();
}

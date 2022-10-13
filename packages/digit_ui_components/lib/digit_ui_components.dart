library digit_ui_components;

import 'package:google_fonts/google_fonts.dart';

export 'widgets/powered_by_digit.dart';

class DigitUiComponent {
  static const DigitUiComponent _instance = DigitUiComponent._internal();
  static DigitUiComponent get instance => _instance;

  const DigitUiComponent._internal();

  Future<void> initThemeComponents() async {
    GoogleFonts.config.allowRuntimeFetching = false;
  }
}

library digit_ui_components;

import 'package:google_fonts/google_fonts.dart';

export 'theme/digit_theme.dart';

export 'widgets/powered_by_digit.dart';
export 'widgets/digit_card.dart';
export 'widgets/scrollable_content.dart';

class DigitUi {
  static const DigitUi _instance = DigitUi._internal();
  static DigitUi get instance => _instance;

  const DigitUi._internal();

  Future<void> initThemeComponents() async {
    GoogleFonts.config.allowRuntimeFetching = false;
  }
}

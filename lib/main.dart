import 'package:digit_ui_components/digit_ui_components.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

void main() {
  DigitUiComponent.instance.initThemeComponents();
  runApp(const MainApplication());
}

class MainApplication extends StatelessWidget {
  const MainApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DigitTheme.instance.mobileTheme,
    );
  }
}

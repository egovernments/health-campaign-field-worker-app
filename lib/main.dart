import 'package:digit_ui_components/digit_ui_components.dart';
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
      home: Scaffold(
        body: Center(
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Normal Font'),
                  const Text('Roboto Font'),
                  ElevatedButton(
                    onPressed: () => showLicensePage(context: context),
                    child: const Text('Show licenses'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

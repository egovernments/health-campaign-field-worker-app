import 'package:digit_components/enum/app_enums.dart';
import 'package:digit_components/widgets/atoms/digit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DigitButton renders correctly and handles tap', (WidgetTester tester) async {
    // Primary button
    await _testButton(tester, ButtonType.primary);

    // Secondary button
    await _testButton(tester, ButtonType.secondary);

    // Tertiary button
    await _testButton(tester, ButtonType.tertiary);

    // Link button
    await _testButton(tester, ButtonType.link);
  });

  testWidgets('DigitButton is disabled and handles tap', (WidgetTester tester) async {
    // Primary button disabled
    await _testDisabledButton(tester, ButtonType.primary);

    // Secondary button disabled
    await _testDisabledButton(tester, ButtonType.secondary);

    // Tertiary button disabled
    await _testDisabledButton(tester, ButtonType.tertiary);

    // Link button disabled
    await _testDisabledButton(tester, ButtonType.link);
  });
}

Future<void> _testButton(WidgetTester tester, ButtonType buttonType) async {
  bool onPressedCalled = false;

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: DigitButton(
          label: 'Click me',
          onPressed: () {
            onPressedCalled = true;
          },
          type: buttonType,
        ),
      ),
    ),
  );

  expect(find.text('Click me'), findsOneWidget);
  expect(tester.widget<DigitButton>(find.byType(DigitButton)).isDisabled, false);

  await tester.tap(find.byType(DigitButton));
  await tester.pump();

  expect(onPressedCalled, true);
}

Future<void> _testDisabledButton(WidgetTester tester, ButtonType buttonType) async {
  bool onPressedCalled = false;

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: DigitButton(
          label: 'Click me',
          onPressed: () {
            onPressedCalled = true;
          },
          type: buttonType,
          isDisabled: true,
        ),
      ),
    ),
  );

  expect(find.text('Click me'), findsOneWidget);
  expect(tester.widget<DigitButton>(find.byType(DigitButton)).isDisabled, true);

  await tester.tap(find.byType(DigitButton));
  await tester.pump();

  expect(onPressedCalled, false);
}

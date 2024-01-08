import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('DigitCheckbox Widget Tests', () {
    testWidgets('DigitCheckbox should render with initial state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitCheckbox(
              label: 'Test Checkbox',
              onChanged: (value) {},
            ),
          ),
        ),
      );

      expect(find.byType(DigitCheckbox), findsOneWidget);
      expect(find.byType(DigitCheckboxIcon), findsOneWidget);
      expect(find.byIcon(Icons.check), findsNothing);
    });

    testWidgets('DigitCheckbox should change state on tap', (WidgetTester tester) async {
      bool isChecked = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitCheckbox(
              label: 'Test Checkbox',
              value: isChecked,
              onChanged: (value) {
                isChecked = value ?? false;
              },
            ),
          ),
        ),
      );

      expect(find.byType(DigitCheckboxIcon), findsOneWidget);
      expect(find.byIcon(Icons.check), findsNothing);

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(find.byType(DigitCheckboxIcon), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);
      expect(isChecked, true);
    });

    testWidgets('DigitCheckbox should be disabled and not change state on tap', (WidgetTester tester) async {
      bool isChecked = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitCheckbox(
              label: 'Test Checkbox',
              value: isChecked,
              onChanged: (value) {
                isChecked = value ?? false;
              },
              disabled: true,
            ),
          ),
        ),
      );

      expect(find.byType(DigitCheckboxIcon), findsOneWidget);
      expect(find.byIcon(Icons.check), findsNothing);

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(find.byType(DigitCheckboxIcon), findsOneWidget);
      expect(find.byIcon(Icons.check), findsNothing);
      expect(isChecked, false);
    });

    testWidgets('DigitCheckbox should change state on multiple taps', (WidgetTester tester) async {
      bool isChecked = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitCheckbox(
              label: 'Test Checkbox',
              value: isChecked,
              onChanged: (value) {
                isChecked = value ?? false;
              },
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.check), findsNothing);

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(find.byIcon(Icons.check), findsOneWidget);
      expect(isChecked, true);

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(find.byIcon(Icons.check), findsNothing);
      expect(isChecked, false);
    });

    testWidgets('DigitCheckbox should have a custom icon color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitCheckbox(
              label: 'Test Checkbox',
              iconColor: Colors.red,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      final iconWidget = tester.widget<DigitCheckboxIcon>(find.byType(DigitCheckboxIcon));
      expect(iconWidget.color, equals(Colors.red));
    });

    testWidgets('DigitCheckbox should trigger onChanged with correct value', (WidgetTester tester) async {
      bool isChecked = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitCheckbox(
              label: 'Test Checkbox',
              value: isChecked,
              onChanged: (value) {
                isChecked = value ?? false;
              },
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.check), findsNothing);

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(find.byIcon(Icons.check), findsOneWidget);
      expect(isChecked, true);
    });

  });
}

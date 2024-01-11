import 'package:digit_components/utils/validators/validator.dart';
import 'package:digit_components/widgets/atoms/digit_numeric_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DigitTextFormInput Tests', () {
    testWidgets('DigitNumericFormInput increments and decrements value', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitNumericFormInput(
              controller: TextEditingController(),
              label: 'Numeric Input',
              initialValue: '0',
              step: 1,
            ),
          ),
        ),
      );

      // Find the widget in the tree
      final numericInput = find.byType(DigitNumericFormInput);

      // Verify the initial value
      expect((tester.widget(numericInput) as DigitNumericFormInput).controller.text, '0');

      // Tap on the suffix icon to increment value
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that the value has been incremented
      expect((tester.widget(numericInput) as DigitNumericFormInput).controller.text, '1');

      // Tap on the prefix icon to decrement value
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      // Verify that the value has been decremented
      expect((tester.widget(numericInput) as DigitNumericFormInput).controller.text, '0');
    });

    testWidgets('Numeric form input validates correctly', (WidgetTester tester) async {
      TextEditingController controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitNumericFormInput(
              controller: controller,
              label: 'Test Label',
              validations: [
                Validator(ValidatorType.minValue, 2,
                    errorMessage: 'Value must be greater than or equal to 1'),
                Validator(ValidatorType.maxValue, 10,
                    errorMessage: 'Minimum value is 10'),
              ],
            ),
          ),
        ),
      );

      // Enter a value less than the minimum allowed
      await tester.enterText(find.byType(DigitNumericFormInput), '0');

      FocusScope.of(tester.element(find.byType(DigitNumericFormInput))).unfocus();
      await tester.pump();

      // Verify that an error is shown
      expect(find.text('Value must be greater than or equal to 1'), findsOneWidget);

      // Enter a value within the allowed range
      await tester.enterText(find.byType(DigitNumericFormInput), '5');
      FocusScope.of(tester.element(find.byType(DigitNumericFormInput))).unfocus();
      await tester.pump();

      // Verify that no error is shown
      expect(find.text('Value must be greater than or equal to 1'), findsNothing);
    });

    testWidgets('DigitNumericFormInput handles isDisabled', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitNumericFormInput(
              controller: TextEditingController(),
              label: 'Numeric Input',
              isDisabled: true,
            ),
          ),
        ),
      );

      // Verify that the widget is in disabled mode
      expect((tester.widget(find.byType(DigitNumericFormInput)) as DigitNumericFormInput).isDisabled, true);
      // You may want to add additional assertions specific to disabled mode.
    });

    testWidgets('DigitNumericFormInput updates value on direct input', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitNumericFormInput(
              controller: TextEditingController(),
              label: 'Numeric Input',
            ),
          ),
        ),
      );

      // Find the widget in the tree
      final numericInput = find.byType(DigitNumericFormInput);

      // Enter a numeric value directly into the input field
      await tester.enterText(numericInput, '42');
      await tester.pump();

      // Verify that the value has been updated
      expect((tester.widget(numericInput) as DigitNumericFormInput).controller.text, '42');
    });

    testWidgets('DigitNumericFormInput handles initial value', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitNumericFormInput(
              controller: TextEditingController(),
              initialValue: '42',
              label: 'Numeric Input',
            ),
          ),
        ),
      );

      // Find the widget in the tree
      final numericInput = find.byType(DigitNumericFormInput);

      // Verify that the initial value is set correctly
      expect((tester.widget(numericInput) as DigitNumericFormInput).controller.text, '42');
    });

    testWidgets('DigitNumericFormInput handles charCount', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitNumericFormInput(
              controller: TextEditingController(),
              label: 'Numeric Input',
              charCount: true,
            ),
          ),
        ),
      );

      // Find the widget in the tree
      final numericInput = find.byType(DigitNumericFormInput);

      // Enter a numeric value directly into the input field
      await tester.enterText(numericInput, '42');
      await tester.pump();

      // Verify that the charCount is displayed
      expect(find.text('2/64'), findsOneWidget);
    });

    testWidgets('DigitNumericFormInput handles custom suffix and prefix icons', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitNumericFormInput(
              controller: TextEditingController(),
              label: 'Numeric Input',
              suffixIcon: Icons.add_circle,
              prefixIcon: Icons.remove_circle,
              step: 1,
            ),
          ),
        ),
      );

      // Find the widget in the tree
      final numericInput = find.byType(DigitNumericFormInput);

      // Verify that custom suffix and prefix icons are displayed
      expect(find.byIcon(Icons.add_circle), findsOneWidget);
      expect(find.byIcon(Icons.remove_circle), findsOneWidget);

      // Tap on the suffix icon to increment value
      await tester.tap(find.byIcon(Icons.add_circle));
      await tester.pump();

      // Verify that the value has been incremented
      expect((tester.widget(numericInput) as DigitNumericFormInput).controller.text, '1');

      // Tap on the prefix icon to decrement value
      await tester.tap(find.byIcon(Icons.remove_circle));
      await tester.pump();

      // Verify that the value has been decremented
      expect((tester.widget(numericInput) as DigitNumericFormInput).controller.text, '0');
    });

    testWidgets('DigitNumericFormInput handles keyboard input', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitNumericFormInput(
              controller: TextEditingController(),
              label: 'Numeric Input',
            ),
          ),
        ),
      );

      // Find the widget in the tree
      final numericInput = find.byType(DigitNumericFormInput);

      // Enter a numeric value using the keyboard
      await tester.enterText(numericInput, '123');
      await tester.pump();

      // Verify that the value has been updated
      expect((tester.widget(numericInput) as DigitNumericFormInput).controller.text, '123');
    });

    testWidgets('DigitNumericFormInput handles onChanged callback', (WidgetTester tester) async {
      String? changedValue;

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitNumericFormInput(
              controller: TextEditingController(),
              label: 'Numeric Input',
              onChange: (value) {
                changedValue = value;
              },
            ),
          ),
        ),
      );

      // Find the widget in the tree
      final numericInput = find.byType(DigitNumericFormInput);

      // Enter a numeric value
      await tester.enterText(numericInput, '42');
      await tester.pump();

      // Verify that the onChanged callback has been called
      expect(changedValue, '42');
    });

    testWidgets('DigitNumericFormInput handles readOnly state', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitNumericFormInput(
              controller: TextEditingController(),
              label: 'Numeric Input',
              readOnly: true,
              initialValue: '0',
            ),
          ),
        ),
      );

      // Find the widget in the tree
      final numericInput = find.byType(DigitNumericFormInput);

      // Try to tap on the suffix icon to increment value (should not change in readOnly mode)
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that the value has not changed
      expect((tester.widget(numericInput) as DigitNumericFormInput).controller.text, '0');
    });

  });
}

import 'package:digit_components/utils/validators/validator.dart';
import 'package:digit_components/widgets/atoms/digit_date_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('DigitTextFormInput Tests', () {
    late TextEditingController controller;

    setUp(() {
      controller = TextEditingController();
    });

    late FocusNode myFocusNode;

    // testing rendering the widget

    testWidgets('Initial rendering', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitDateFormInput(controller: controller),
          ),
        ),
      );

      // Ensure the widget is rendered
      expect(find.byType(DigitDateFormInput), findsOneWidget);
    });

    testWidgets('Date selection updates controller text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitDateFormInput(controller: controller),
          ),
        ),
      );

      // Tap the suffix icon to show the date picker
      await tester.tap(find.byIcon(Icons.date_range));
      await tester.pumpAndSettle();

      // Select a date from the date picker
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Ensure the controller's text is updated with the selected date
      final selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
      expect(controller.text, equals(selectedDate));
    });

    testWidgets('ReadOnly widget cannot be edited', (WidgetTester tester) async {
      final readOnlyController = TextEditingController(text: '2023-12-15');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitDateFormInput(controller: readOnlyController, readOnly: true),
          ),
        ),
      );

      // Try to tap on the suffix icon (date picker)
      await tester.tap(find.byIcon(Icons.date_range));
      await tester.pumpAndSettle();

      // Ensure the controller's text is not changed
      expect(readOnlyController.text, equals('2023-12-15'));
    });

    // TODO
    // testWidgets('Validation error is displayed', (WidgetTester tester) async {
    //   final validationController = TextEditingController();
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: DigitDateFormInput(
    //           controller: validationController,
    //           validations: [Validator(ValidatorType.date, 'Invalid date format')],
    //         ),
    //       ),
    //     ),
    //   );
    //
    //   // Enter an invalid date format
    //   await tester.enterText(find.byType(TextFormField), 'invalid_date');
    //   await tester.pumpAndSettle();
    //
    //   // Ensure the validation error is displayed
    //   expect(find.text('Invalid date format'), findsOneWidget);
    // });

    testWidgets('Help text is displayed', (WidgetTester tester) async {
      final helpTextController = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitDateFormInput(
              controller: helpTextController,
              helpText: 'hint.',
            ),
          ),
        ),
      );

      // Ensure the help text is displayed
      expect(find.text('hint.'), findsOneWidget);
    });

    testWidgets('Empty initial value does not trigger validation error', (WidgetTester tester) async {
      final emptyController = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitDateFormInput(
              controller: emptyController,
              validations: [Validator(ValidatorType.required, 'Field is required')],
            ),
          ),
        ),
      );

      // Trigger validation without entering anything
      await tester.pumpAndSettle();

      // Ensure no validation error is displayed
      expect(find.text('Field is required'), findsNothing);
    });

    testWidgets('Handles tooltip behavior', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitDateFormInput(
              controller: controller,
              label: 'Test Label',
              info: true,
              infoText: 'Info Tooltip',
            ),
          ),
        ),
      );

      // Verify the tooltip is not initially present
      expect(find.text('Info Tooltip'), findsNothing);

      // Trigger the tooltip with a long press (simulate hover)
      await tester.longPress(find.byIcon(Icons.info_outline));

      // Pump the widget tree to allow time for the tooltip to appear
      await tester.pump();

      // Verify the tooltip is now present
      expect(find.text('Info Tooltip'), findsOneWidget);
    });

  });
}

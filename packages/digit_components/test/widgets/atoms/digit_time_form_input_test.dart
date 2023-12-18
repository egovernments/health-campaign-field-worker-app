import 'package:digit_components/utils/validators/validator.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_time_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DigitTextFormInput Tests', () {
    late TextEditingController controller;

    setUp(() {
      controller = TextEditingController();
    });

    testWidgets('Renders without error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTimeFormInput(
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.byType(DigitTimeFormInput), findsOneWidget);
    });

    testWidgets('Displays time icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTimeFormInput(
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.access_time), findsOneWidget);
    });

    testWidgets('Opens time picker on suffix icon tap', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTimeFormInput(
              controller: controller,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.access_time));
      await tester.pumpAndSettle();

      expect(find.byType(TimePickerDialog), findsOneWidget);
    });

    testWidgets('Updates controller value on time picker selection', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTimeFormInput(
              controller: controller,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.access_time));
      await tester.pumpAndSettle();

      // Select a time in the time picker
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Ensure that the controller's value is updated
      expect(controller.text, isNotEmpty);
    });

    testWidgets('Formats time correctly', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTimeFormInput(
              controller: controller,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.access_time));
      await tester.pumpAndSettle();

      // Select a time in the time picker
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Ensure that the controller's value is formatted correctly
      final formattedTimeRegex = RegExp(r'^\d{2}:\d{2} (AM|PM)$');
      expect(formattedTimeRegex.hasMatch(controller.text), isTrue);
    });

    testWidgets('Updates value on text input', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTimeFormInput(
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'newTimeText');
      expect(controller.text, 'newTimeText');
    });

    testWidgets('read only true', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTimeFormInput(
              controller: controller,
              readOnly: true,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.access_time));
      await tester.pumpAndSettle();

      expect(find.byType(TimePickerDialog), findsNothing);
    });

  });
}

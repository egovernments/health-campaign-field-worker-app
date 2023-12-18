import 'package:digit_components/utils/validators/validator.dart';
import 'package:digit_components/widgets/atoms/digit_password_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_input.dart';
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
            body: DigitPasswordFormInput(
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.byType(DigitPasswordFormInput), findsOneWidget);
    });

    testWidgets('Toggles visibility on suffix icon tap', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitPasswordFormInput(
              controller: controller,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);

      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      expect(find.byIcon(Icons.visibility), findsOneWidget);

      // Perform other assertions based on your specific use case
    });

    testWidgets('Updates value on text input', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitPasswordFormInput(
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DigitPasswordFormInput), 'newPassword');
      expect(controller.text, 'newPassword');

      // Additional value updating scenarios can be added here
    });

    testWidgets('Displays char count properly', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitPasswordFormInput(
              controller: controller,
              charCount: true,
            ),
          ),
        ),
      );

      await tester.pump();

      // Perform assertions based on char count display
      expect(find.text('0/64'), findsOneWidget);


      // Additional char count scenarios can be added here
    });

    testWidgets('Displays help text', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitPasswordFormInput(
              controller: controller,
              helpText: 'Enter a strong password',
            ),
          ),
        ),
      );


      await tester.pump();

      // Perform assertions based on help text and error message
      expect(find.text('Enter a strong password'), findsOneWidget);

    });

    testWidgets('Handles readOnly state', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitPasswordFormInput(
              controller: controller,
              readOnly: true,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.visibility_off));
      expect(find.byType(DigitPasswordFormInput), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });

  });
}

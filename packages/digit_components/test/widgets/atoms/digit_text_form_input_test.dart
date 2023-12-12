import 'package:digit_components/utils/validators/validator.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('DigitTextFormInput Tests', () {
    late TextEditingController controller;

    setUp(() {
      controller = TextEditingController();
    });

    // testWidgets('Renders the widget', (WidgetTester tester) async {
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: DigitTextFormInput(
    //           controller: controller,
    //           label: 'Test Label',
    //         ),
    //       ),
    //     ),
    //   );
    //
    //   // Ensure the label is rendered
    //   expect(find.text('Test Label'), findsOneWidget);
    //
    //   // Add more widget verification as needed
    // });

    testWidgets('Validates input using provided validators', (WidgetTester tester) async {
      // Add your custom validators for testing
      final validators = [
        Validator(ValidatorType.minLength, 6,
            errorMessage:
            'Password must be at least 6 characters.'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextFormInput(
              controller: controller,
              label: 'Test Label',
              validations: validators,
            ),
          ),
        ),
      );

      // Trigger validation with invalid input
      controller.text = 'ab';
      await tester.pump();
      // Print the widget tree
      print(tester.allRenderObjects);
      expect(tester.takeException(), isNull);

      // Verify that the error callback is triggered
      expect(find.text('Password must be at least 6 characters.'), findsOneWidget);


      // Trigger validation with valid input
      controller.text = 'abc';
      await tester.pump();

      // Verify that the error callback is not triggered
      expect(find.text('Password must be at least 6 characters.'), findsOneWidget);

    });

    // testWidgets('Handles readOnly and isDisabled states', (WidgetTester tester) async {
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: Column(
    //           children: [
    //             DigitTextFormInput(
    //               key: Key('Editable Field'), // Add key for the editable field
    //               controller: controller,
    //               label: 'Editable Field',
    //             ),
    //             DigitTextFormInput(
    //               key: Key('ReadOnly Field'), // Add key for the readOnly field
    //               controller: controller,
    //               label: 'ReadOnly Field',
    //               readOnly: true,
    //             ),
    //             DigitTextFormInput(
    //               key: Key('Disabled Field'), // Add key for the disabled field
    //               controller: controller,
    //               label: 'Disabled Field',
    //               isDisabled: true,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    //
    //   // Verify the editable field is enabled
    //   expect(tester.widget<TextFormField>(find.byKey(Key('Editable Field'))).enabled, isTrue);
    //
    //   // Verify the readOnly field is not enabled
    //   expect(tester.widget<TextFormField>(find.byKey(Key('ReadOnly Field'))).enabled, isFalse);
    //
    //   // Verify the disabled field is not enabled
    //   expect(tester.widget<TextFormField>(find.byKey(Key('Disabled Field'))).enabled, isFalse);
    // });


    // Add more tests for different scenarios, such as interaction testing, tooltip behavior, etc.

    // testWidgets('Handles tooltip behavior', (WidgetTester tester) async {
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: DigitTextFormInput(
    //           controller: controller,
    //           label: 'Test Label',
    //           info: true,
    //           infoText: 'Info Tooltip',
    //         ),
    //       ),
    //     ),
    //   );
    //
    //   // Verify the tooltip is not initially present
    //   expect(find.text('Info Tooltip'), findsNothing);
    //
    //   // Trigger the tooltip
    //   await tester.longPress(find.byType(TextFormField));
    //
    //   // Verify the tooltip is now present
    //   expect(find.text('Info Tooltip'), findsOneWidget);
    // });

    // Add more edge cases and scenarios as needed

    // ...

  });
}

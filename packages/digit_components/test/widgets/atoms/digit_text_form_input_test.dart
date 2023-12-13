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

    // testing rendering the widget

    testWidgets('Renders the widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextFormInput(
              controller: controller,
              label: 'Test Label',
            ),
          ),
        ),
      );

      // Ensure the label is rendered
      expect(find.text('Test Label'), findsOneWidget);

    });


    // testing validation and error message

    testWidgets('Validates input using provided validators', (WidgetTester tester) async {

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextFormInput(
              controller: controller,
              label: 'Test Label',
              validations: [
                Validator(ValidatorType.pattern, r'^[a-zA-Z0-9]+$',
                    errorMessage: 'Invalid format.'),
              ],
            ),
          ),
        ),
      );

      // Trigger validation with invalid input
      controller.text = '@@';
      await tester.pump();
      await tester.pumpAndSettle(); // Ensure any asynchronous work is completed

// Print the widget tree for debugging
      print(tester.allRenderObjects);
// Trigger validation with invalid input
      controller.text = '@@';
      await tester.pump();
      await tester.pumpAndSettle(); // Ensure any asynchronous work is completed

// Trigger validation with invalid input
      controller.text = '@@';
      await tester.pump();
      await tester.pumpAndSettle(); // Ensure any asynchronous work is completed

// // Find the widget using find.descendant with a custom condition
//       expect(find.descendant(
//         of: find.byType(Row), // Assuming the error message is inside a Row widget
//         matching: find.byElementPredicate((Element element) {
//           if (element.widget is Row) {
//             // Check if the Row contains an Icon followed by Text
//             final rowChildren = (element.widget as Row).children;
//             if (rowChildren.length >= 2 &&
//                 rowChildren[0] is Icon &&
//                 rowChildren[1] is Text &&
//                 (rowChildren[1] as Text).data == 'Invalid format.') {
//               return true;
//             }
//           }
//           return false;
//         }),
//       ), findsOneWidget);


      // Trigger validation with valid input
      controller.text = 'abcdeft';
      await tester.pump();

      // Verify that the error callback is not triggered
      expect(find.text('Invalid format.'), findsNothing);

    });

    // testing readonly and isdisabled states

    testWidgets('Handles readOnly and isDisabled states', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                DigitTextFormInput(
                  key: Key('Editable Field'),
                  controller: controller,
                  label: 'Editable Field',
                ),
                DigitTextFormInput(
                  key: Key('ReadOnly Field'),
                  controller: controller,
                  label: 'ReadOnly Field',
                  readOnly: true,
                ),
                DigitTextFormInput(
                  key: Key('Disabled Field'),
                  controller: controller,
                  label: 'Disabled Field',
                  isDisabled: true,
                ),
              ],
            ),
          ),
        ),
      );

      // Verify the editable field is enabled
      expect(
        tester.widget<DigitTextFormInput>(find.byKey(Key('Editable Field'))).readOnly,
        isFalse,
      );
      expect(
        tester.widget<DigitTextFormInput>(find.byKey(Key('Editable Field'))).isDisabled,
        isFalse,
      );

      // Verify the readOnly field is readOnly and not enabled
      expect(
        tester.widget<DigitTextFormInput>(find.byKey(Key('ReadOnly Field'))).readOnly,
        isTrue,
      );
      expect(
        tester.widget<DigitTextFormInput>(find.byKey(Key('ReadOnly Field'))).isDisabled,
        isFalse,
      );

      // Verify the disabled field is disabled and not enabled
      expect(
        tester.widget<DigitTextFormInput>(find.byKey(Key('Disabled Field'))).readOnly,
        isFalse,
      );
      expect(
        tester.widget<DigitTextFormInput>(find.byKey(Key('Disabled Field'))).isDisabled,
        isTrue,
      );
    });



   // testing tooltip behavior

    testWidgets('Handles tooltip behavior', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextFormInput(
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

    //Testing Char Count Display


    testWidgets('Displays character count if charCount is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextFormInput(
              controller: controller,
              label: 'Test Label',
              charCount: true,
              initialValue: 'helloworld',
              validations: [
                Validator(ValidatorType.maxLength, 10,
                    errorMessage: 'Maximum length is 10.'),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify the updated character count is displayed (should be capped at 10)
      expect(find.text('10/10'), findsOneWidget);
    });

    //Testing Prefix and Suffix Icons

    testWidgets('Displays prefix and suffix icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextFormInput(
              controller: controller,
              label: 'Test Label',
              prefixIcon: Icons.person,
              suffixIcon: Icons.visibility,
            ),
          ),
        ),
      );

      // Verify the prefix and suffix icons are displayed
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });


    // need to complete this test case
    //Testing Prefix and Suffix Icon Click Handling

    // testWidgets('Handles click events on prefix and suffix icons', (WidgetTester tester) async {
    //   bool prefixIconClicked = false;
    //   bool suffixIconClicked = false;
    //
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: DigitTextFormInput(
    //           controller: controller,
    //           label: 'Test Label',
    //           prefixIcon: Icons.person,
    //           suffixIcon: Icons.visibility,
    //           onPrefixIconClick: () {
    //             prefixIconClicked = true;
    //           },
    //           onSuffixIconClick: () {
    //             suffixIconClicked = true;
    //           },
    //         ),
    //       ),
    //     ),
    //   );
    //
    //   // Tap on prefix icon
    //   await tester.tap(find.byIcon(Icons.person));
    //   expect(prefixIconClicked, isTrue);
    //
    //   // Tap on suffix icon
    //   await tester.tap(find.byIcon(Icons.visibility));
    //   expect(suffixIconClicked, isTrue);
    // });

    //Testing Initial Value

    testWidgets('Sets initial value correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextFormInput(
              controller: controller,
              label: 'Test Label',
              initialValue: 'Initial Value',
            ),
          ),
        ),
      );

      // Verify the initial value is set
      expect(find.text('Initial Value'), findsOneWidget);
    });


  });
}

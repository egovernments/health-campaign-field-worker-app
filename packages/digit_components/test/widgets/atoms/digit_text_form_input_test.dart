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

    late FocusNode myFocusNode;

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

    testWidgets('Validates input using provided validators on focus loss', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                DigitTextFormInput(

                  controller: controller,
                  label: 'Test Label',
                  validations: [
                    Validator(ValidatorType.pattern, r'^[a-zA-Z0-9]+$', errorMessage: 'Invalid format.'),
                  ],
                ),
                // Use a FlatButton to simulate taps
                ElevatedButton(
                  onPressed: () {
                    // This is where you can put any logic you want
                    FocusScope.of(tester.element(find.byType(DigitTextFormInput))).unfocus();
                  },
                  child: Text('Tap me'),
                ),
              ],
            ),
          ),
        ),
      );

      // Simulate typing
      await tester.enterText(find.byType(DigitTextFormInput), '@@');
      await tester.pump();

      // Tap on the FlatButton to simulate focus loss
      await tester.tap(find.text('Tap me'));


      // Ensure all asynchronous operations are completed
      await tester.pumpAndSettle(); // Ensure all asynchronous operations are completed


      // Ensure the validation error is shown after the focus loss
      expect(find.text('Invalid format.'), findsOneWidget);
    });


    // testing readonly and isdisabled states


    testWidgets('Handles readOnly and isDisabled states',
        (WidgetTester tester) async {
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
        tester
            .widget<DigitTextFormInput>(find.byKey(Key('Editable Field')))
            .readOnly,
        isFalse,
      );
      expect(
        tester
            .widget<DigitTextFormInput>(find.byKey(Key('Editable Field')))
            .isDisabled,
        isFalse,
      );

      // Verify the readOnly field is readOnly and not enabled
      expect(
        tester
            .widget<DigitTextFormInput>(find.byKey(Key('ReadOnly Field')))
            .readOnly,
        isTrue,
      );
      expect(
        tester
            .widget<DigitTextFormInput>(find.byKey(Key('ReadOnly Field')))
            .isDisabled,
        isFalse,
      );

      // Verify the disabled field is disabled and not enabled
      expect(
        tester
            .widget<DigitTextFormInput>(find.byKey(Key('Disabled Field')))
            .readOnly,
        isFalse,
      );
      expect(
        tester
            .widget<DigitTextFormInput>(find.byKey(Key('Disabled Field')))
            .isDisabled,
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

    testWidgets('Displays character count if charCount is true',
        (WidgetTester tester) async {
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

    testWidgets('Displays prefix and suffix icons',
        (WidgetTester tester) async {
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

    // Testing Prefix and Suffix Icon Click Handling
    //
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

    // Testing Initial Value

    testWidgets('Sets initial value correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextFormInput(
              controller: controller,
              label: 'Test Label',
              initialValue: 'Initial',
            ),
          ),
        ),
      );

      // Verify the initial value is set
      expect(find.text('Initial'), findsOneWidget);
    });
  });
}

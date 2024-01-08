import 'package:digit_components/models/RadioButtonModel.dart';
import 'package:digit_components/widgets/atoms/digit_radio_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DigitRadioList Widget Tests', () {
    testWidgets('Widget renders correctly', (WidgetTester tester) async {
      // Build our widget and trigger a frame
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitRadioList(
              radioButtons: [
                RadioButtonModel(code: 'A', name: 'Option A'),
                RadioButtonModel(code: 'B', name: 'Option B'),
              ],
              onChanged: (selectedValue) {},
            ),
          ),
        ),

      );

      // Verify that the widget renders correctly
      expect(find.text('Option A'), findsOneWidget);
      expect(find.text('Option B'), findsOneWidget);
    });

    testWidgets('Selecting a radio button triggers onChanged callback', (WidgetTester tester) async {
      String selectedValue = '';

      // Build our widget and trigger a frame
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitRadioList(
              radioButtons: [
                RadioButtonModel(code: 'A', name: 'Option A'),
                RadioButtonModel(code: 'B', name: 'Option B'),
              ],
              onChanged: (value) {
                selectedValue = value;
              },
            ),
          ),
        ),

      );

      // Tap on the first radio button
      await tester.tap(find.text('Option A'));
      await tester.pump();

      // Verify that the onChanged callback is called with the correct value
      expect(selectedValue, 'A');
    });

    testWidgets('Radio buttons are disabled when isDisabled is true', (WidgetTester tester) async {
      // Build our widget with isDisabled set to true
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitRadioList(
              radioButtons: [
                RadioButtonModel(code: 'A', name: 'Option A'),
                RadioButtonModel(code: 'B', name: 'Option B'),
              ],
              onChanged: (selectedValue) {},
              isDisabled: true,
            ),
          ),
        ),
      );

      // Verify that the radio buttons are disabled and selected value doesn't change
      await tester.tap(find.text('Option A'));
      await tester.pump();
      expect(tester.widget<DigitRadioList>(find.byType(DigitRadioList)).groupValue, ''); // No change in selected value
    });

    testWidgets('Radio buttons are enabled when isDisabled is false', (WidgetTester tester) async {
      // Build our widget with isDisabled set to false
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitRadioList(
              radioButtons: [
                RadioButtonModel(code: 'A', name: 'Option A'),
                RadioButtonModel(code: 'B', name: 'Option B'),
              ],
              onChanged: (selectedValue) {},
              isDisabled: false,
            ),
          ),
        ),
      );

      // Verify that the radio buttons are enabled and selected value changes
      await tester.tap(find.text('Option A'));
      await tester.pump();
      expect(tester.widget<DigitRadioList>(find.byType(DigitRadioList)).groupValue, 'A'); // Change in selected value
    });

  });
}

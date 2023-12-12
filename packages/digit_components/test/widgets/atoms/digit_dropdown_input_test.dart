import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digit_components/widgets/atoms/digit_dropdown_input.dart';

void main() {
  group('DigitDropdown Tests', () {
    // testWidgets('Dropdown opens and closes', (WidgetTester tester) async {
    //   // Build our app and trigger a frame.
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: DigitDropdown<String>(
    //           textEditingController: TextEditingController(),
    //           items: const [
    //             DropdownItem<String>(value: 'Option 1', child: Text('Option 1')),
    //             DropdownItem<String>(value: 'Option 2', child: Text('Option 2')),
    //             // Add more items as needed
    //           ],
    //           onChange: (value, index) {},
    //           child: const Text('Dropdown'),
    //         ),
    //       ),
    //     ),
    //   );
    //
    //   // Tap the TextField to open the dropdown
    //   await tester.tap(find.byType(TextField));
    //   await tester.pump();
    //
    //   // Check if the dropdown is open
    //   expect(find.byType(ListView), findsOneWidget);
    //
    //   // Tap away to close the dropdown
    //   await tester.tapAt(const Offset(0, 0));
    //   await tester.pump();
    //
    //   // Check if the dropdown is closed
    //   expect(find.byType(ListView), findsNothing);
    // });

    testWidgets('Dropdown item selection', (WidgetTester tester) async {
      String selectedValue = '';

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitDropdown<String>(
              textEditingController: TextEditingController(),
              items: const [
                DropdownItem<String>(value: 'Option 1', child: Text('Option 1')),
                DropdownItem<String>(value: 'Option 2', child: Text('Option 2')),
              ],
              onChange: (value, index) {
                selectedValue = value;
                print(value);
                print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
              },
              child: const Text('Dropdown'),
            ),
          ),
        ),
      );

      // Tap the TextField to open the dropdown
      await tester.tap(find.byType(TextField));
      // await tester.pump();

      // Tap on the first item in the dropdown
      await tester.tap(find.text('Option 1'));
      // Pump for a duration slightly longer than the animation duration
      await tester.pump(const Duration(milliseconds: 300));
      await tester.pumpAndSettle();

      // Check if the onChange callback was called and the selected value is correct
      expect(selectedValue, 'Option 1');
    });


  });
}

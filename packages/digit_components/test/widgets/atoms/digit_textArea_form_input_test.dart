import 'package:digit_components/utils/validators/validator.dart';
import 'package:digit_components/widgets/atoms/digit_text_area_form_input.dart';
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
            body: DigitTextAreaFormInput(
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.byType(DigitTextAreaFormInput), findsOneWidget);
    });

    testWidgets('Displays the specified number of lines', (WidgetTester tester) async {
      const int minLines = 4;
      const int maxLines = 8;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextAreaFormInput(
              controller: TextEditingController(),
              minLine: minLines,
              maxLine: maxLines,
            ),
          ),
        ),
      );

      final textField = tester.widget<DigitTextAreaFormInput>(find.byType(DigitTextAreaFormInput));
      expect(textField.minLine, minLines);
      expect(textField.maxLine, maxLines);
    });

    testWidgets('Updates value on text input', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextAreaFormInput(
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DigitTextAreaFormInput), 'newTextAreaText');
      expect(controller.text, 'newTextAreaText');
    });

    testWidgets('Handles readOnly state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextAreaFormInput(
              controller: TextEditingController(),
              readOnly: true,
            ),
          ),
        ),
      );
      await tester.enterText(find.byType(DigitTextAreaFormInput), 'newTextAreaText');
      expect(controller.text, '');
    });

    testWidgets('Handles disabled state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextAreaFormInput(
              controller: TextEditingController(),
              isDisabled: true,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DigitTextAreaFormInput), 'newTextAreaText');
      expect(controller.text, '');
    });

    testWidgets('Displays help text', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextAreaFormInput(
              controller: controller,
              helpText: 'Enter text',
            ),
          ),
        ),
      );

      await tester.pump();

      // Perform assertions based on help text
      expect(find.text('Enter text'), findsOneWidget);

    });

    testWidgets('Handles char count properly', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextAreaFormInput(
              controller: controller,
              charCount: true,
            ),
          ),
        ),
      );

      // Trigger validation by losing focus
      await tester.tap(find.byType(TextFormField));
      await tester.pump();

      // Perform assertions based on char count display
      expect(find.text('0/64'), findsOneWidget);

    });

    testWidgets('Updates value on text input', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitTextAreaFormInput(
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DigitTextAreaFormInput), 'newTextAreaText');
      expect(controller.text, 'newTextAreaText');
    });

  });
}
// testWidgets('Location permission granted updates controller text', (WidgetTester tester) async {
//   when(mockGeolocator.checkPermission()).thenAnswer((_) async => LocationPermission.whileInUse);
//   when(mockGeolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high))
//       .thenAnswer((_) async => Position(latitude: 37.7749, longitude: -122.4194));
//
//   await tester.pumpWidget(
//     MaterialApp(
//       home: Scaffold(
//         body: DigitLocationFormInput(controller: controller),
//       ),
//     ),
//   );
//
//   // Tap the suffix icon to get location
//   await tester.tap(find.byIcon(Icons.my_location));
//
//   // Allow time for the asynchronous operation to complete
//   await tester.pumpAndSettle();
//
//   // Ensure the controller's text is updated with the expected location
//   expect(controller.text, '37.7749, -122.4194');
// });
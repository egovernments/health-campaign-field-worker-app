import 'package:digit_components/utils/validators/validator.dart';
import 'package:digit_components/widgets/atoms/digit_search_form_input.dart';
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
            body: DigitSearchFormInput(
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.byType(DigitSearchFormInput), findsOneWidget);
    });

    testWidgets('Displays search icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitSearchFormInput(
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('Calls onSuffixTap on suffix icon tap', (WidgetTester tester) async {
      bool onTapCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitSearchFormInput(
              controller: TextEditingController(),
              onSuffixTap: (value) {
                onTapCalled = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();

      expect(onTapCalled, isTrue);
    });

    testWidgets('Handles readOnly state', (WidgetTester tester) async {
      bool onTapCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitSearchFormInput(
              controller: TextEditingController(),
              readOnly: true,
              onSuffixTap: (value) {
                onTapCalled = true;
              },
            ),
          ),
        ),
      );

      // Ensure the suffix icon is disabled when readOnly is true
      expect(find.byIcon(Icons.search), findsOneWidget);
      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();


      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(onTapCalled, isFalse);
    });

    testWidgets('Displays help text', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitSearchFormInput(
              controller: controller,
              helpText: 'Enter search query',
            ),
          ),
        ),
      );

      // Trigger validation by losing focus
      await tester.tap(find.byType(TextFormField));
      await tester.pump();

      // Perform assertions based on help text and error message
      expect(find.text('Enter search query'), findsOneWidget);
      expect(find.text('Search query cannot be empty'), findsNothing);
    });

    testWidgets('Updates value on text input', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitSearchFormInput(
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DigitSearchFormInput), 'newSearchText');
      expect(controller.text, 'newSearchText');
    });

    testWidgets('Handles disabled state', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DigitSearchFormInput(
              controller: controller,
              isDisabled: true,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DigitSearchFormInput), 'newSearchText');
      await tester.pump();

      // No change should occur in disabled state
      expect(controller.text, '');
    });

  });
}

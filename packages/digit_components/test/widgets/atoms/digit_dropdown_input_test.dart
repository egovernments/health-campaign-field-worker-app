import 'package:digit_components/enum/app_enums.dart';
import 'package:digit_components/models/DropdownModels.dart';
import 'package:digit_components/widgets/atoms/digit_dropdown_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('DigitDropdown - Tap suffix icon to open and tap anywhere to close', (WidgetTester tester) async {
    /// Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DigitDropdown(
            textEditingController: TextEditingController(),
            onChange: (value, index) {},
            items: const [
              DropdownItem(name: 'Item 1', code: ''),
              DropdownItem(name: 'Item 2', code: ''),
              DropdownItem(name: 'Item 3', code: ''),
            ],
          ),
        ),
      ),
    );

    /// Tap suffix icon to open the dropdown.
    await tester.tap(find.byIcon(Icons.arrow_drop_down));
    await tester.pump();

    /// Dropdown should be open.
    expect(find.byType(ListView), findsOneWidget);

    /// Tap anywhere outside the dropdown to close it.
    await tester.tap(find.byType(GestureDetector, skipOffstage: false).first);
    await tester.pump();

    /// Dropdown should be closed.
    expect(find.byType(ListView), findsNothing);
  });

  testWidgets('DigitDropdown - Select an item', (WidgetTester tester) async {
    /// Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DigitDropdown(
            textEditingController: TextEditingController(),
            onChange: (value, index) {},
            items: const [
              DropdownItem(name: 'Item 1', code: '1'),
              DropdownItem(name: 'Item 2', code: '2'),
              DropdownItem(name: 'Item 3', code: '3'),
            ],
          ),
        ),
      ),
    );

    /// Tap suffix icon to open the dropdown.
    await tester.tap(find.byIcon(Icons.arrow_drop_down));
    await tester.pump();

    /// Get the offset of the center of the widget.
    final Offset widgetCenter = tester.getCenter(find.text('Item 2'));

    /// Tap at the widget's center.
    await tester.tapAt(widgetCenter);
    await tester.pump();

    /// Verify that the selected item is displayed in the text field.
    expect(find.text('Item 2'), findsOneWidget);
  });

  testWidgets('DigitDropdown - Filter items', (WidgetTester tester) async {
    /// Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DigitDropdown(
            textEditingController: TextEditingController(),
            onChange: (value, index) {},
            items: const [
              DropdownItem(name: 'Apple', code: 'A'),
              DropdownItem(name: 'Banana', code: 'B'),
              DropdownItem(name: 'Orange', code: 'O'),
            ],
          ),
        ),
      ),
    );

    /// Tap suffix icon to open the dropdown.
    await tester.tap(find.byIcon(Icons.arrow_drop_down));
    await tester.pump();

    /// Enter text in the search field to filter items.
    await tester.enterText(find.byType(TextField), 'Ban');
    await tester.pump();

    /// Verify that only 'Banana' is visible in the dropdown.
    expect(find.text('Banana'), findsOneWidget);
    expect(find.text('Apple'), findsNothing);
    expect(find.text('Orange'), findsNothing);
  });

  testWidgets('DigitDropdown - Dropdown with Descriptions', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DigitDropdown(
            textEditingController: TextEditingController(),
            onChange: (value, index) {},
            items: const [
              DropdownItem(name: 'Item 1', code: '1', description: 'Description 1'),
              DropdownItem(name: 'Item 2', code: '2', description: 'Description 2'),
              DropdownItem(name: 'Item 3', code: '3', description: 'Description 3'),
            ],
          ),
        ),
      ),
    );

    /// Tap suffix icon to open the dropdown.
    await tester.tap(find.byIcon(Icons.arrow_drop_down));
    await tester.pump();

    /// Verify that items with descriptions are displayed.
    expect(find.text('Description 1'), findsOneWidget);
    expect(find.text('Description 2'), findsOneWidget);
    expect(find.text('Description 3'), findsOneWidget);
  });


  testWidgets('DigitDropdown - Select an item with description', (WidgetTester tester) async {
    /// Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DigitDropdown(
            textEditingController: TextEditingController(),
            onChange: (value, index) {},
            items: const [
              DropdownItem(name: 'Item 1', code: '1', description: 'Description 1'),
              DropdownItem(name: 'Item 2', code: '2', description: 'Description 2'),
              DropdownItem(name: 'Item 3', code: '3', description: 'Description 3'),
            ],
          ),
        ),
      ),
    );

    /// Tap suffix icon to open the dropdown.
    await tester.tap(find.byIcon(Icons.arrow_drop_down));
    await tester.pump();

    /// Get the offset of the center of the widget.
    final Offset widgetCenter = tester.getCenter(find.text('Item 2'));

    /// Tap at the widget's center.
    await tester.tapAt(widgetCenter);
    await tester.pump();

    /// Verify that the selected item with description is displayed in the text field.
    expect(find.text('Item 2'), findsOneWidget);
    expect(find.text('Description 2'), findsOneWidget);
  });


  testWidgets('DigitDropdown - Select an item with type', (WidgetTester tester) async {
    /// Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DigitDropdown(
            textEditingController: TextEditingController(),
            onChange: (value, index) {},
            dropdownType: DropdownType.nestedSelect,
            items: const [
              DropdownItem(name: 'Item 1', code: '1', type: 'Type A'),
              DropdownItem(name: 'Item 2', code: '2', type: 'Type B'),
              DropdownItem(name: 'Item 3', code: '3', type: 'Type A'),
            ],
          ),
        ),
      ),
    );

    /// Tap suffix icon to open the dropdown.
    await tester.tap(find.byIcon(Icons.arrow_drop_down));
    await tester.pumpAndSettle(); /// Wait for animations to complete.

    /// Get the offset of the center of the widget.
    final Offset widgetCenter = tester.getCenter(find.text('Item 2'));

    /// Tap at the widget's center.
    await tester.tapAt(widgetCenter);
    await tester.pumpAndSettle(); /// Wait for animations to complete.

    /// Verify that the selected item with type is displayed in the text field.
    expect(find.byType(DigitDropdown), findsOneWidget);
    final String selectedValue = tester.widget<DigitDropdown>(find.byType(DigitDropdown)).textEditingController.text;
    expect(selectedValue, 'Type B,Item 2');
  });

  testWidgets('DigitDropdown - Empty Item List', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DigitDropdown(
            textEditingController: TextEditingController(),
            onChange: (value, index) {},
            items: const [], // Empty list
          ),
        ),
      ),
    );

    /// Tap suffix icon to open the dropdown.
    await tester.tap(find.byIcon(Icons.arrow_drop_down));
    await tester.pump();

    /// Verify that the empty item text is displayed.
    expect(find.text('No Options available'), findsOneWidget);
  });

  testWidgets('DigitDropdown - Dropdown with Icons', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DigitDropdown(
            textEditingController: TextEditingController(),
            onChange: (value, index) {},
            textIcon: Icons.star,
            items: const [
              DropdownItem(name: 'Item 1', code: '1', ),
              DropdownItem(name: 'Item 2', code: '2', ),
              DropdownItem(name: 'Item 3', code: '3', ),
            ],
          ),
        ),
      ),
    );

    /// Tap suffix icon to open the dropdown.
    await tester.tap(find.byIcon(Icons.arrow_drop_down));
    await tester.pump();

    /// Verify that the items with icons are displayed.
    expect(find.byIcon(Icons.star), findsWidgets);
  });

}

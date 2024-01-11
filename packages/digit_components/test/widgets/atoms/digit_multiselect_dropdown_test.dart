import 'package:digit_components/enum/app_enums.dart';
import 'package:digit_components/models/DropdownModels.dart';
import 'package:digit_components/widgets/atoms/digit_multiselect_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'MultiSelectDropDown - Initial State', (WidgetTester tester) async {
    /// Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MultiSelectDropDown<int>(
            onOptionSelected: (selectedOptions) {},
            options: const [
              DropdownItem(name: 'Item 1', code: '1'),
              DropdownItem(name: 'Item 2', code: '2'),
              DropdownItem(name: 'Item 3', code: '3'),
            ],
          ),
        ),
      ),
    );

    /// Verify that the dropdown is not initially visible.
    expect(find.byType(MultiSelectDropDown<int>), findsOneWidget);
    expect(find.byType(ListView), findsNothing);
  });

  testWidgets('MultiSelectDropDown - Selection', (WidgetTester tester) async {
    /// Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MultiSelectDropDown<int>(
            onOptionSelected: (selectedOptions) {},
            options: const [
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

    /// Tap at the widget's center using tester.tapAt.
    await tester.tapAt(widgetCenter);
    await tester.pumpAndSettle();

    /// Close the dropdown by tapping outside.
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle();
    /// Verify that the selected item is displayed.

    expect(find.text('Item 2'), findsWidgets);
  });


  testWidgets(
      'MultiSelectDropDown - Clear Selection', (WidgetTester tester) async {
    /// Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MultiSelectDropDown<int>(
            onOptionSelected: (selectedOptions) {},
            options: const [
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

    /// Tap at the widget's center using tester.tapAt.
    await tester.tapAt(widgetCenter);
    await tester.pumpAndSettle();

    /// Close the dropdown by tapping outside.
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle();

    /// Verify that the selected item is displayed.
    expect(find.text('1 Selected'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);

    /// Clear the selection.
    await tester.tap(find.text('Clear All'));
    await tester.pump();

    /// Verify that the selection is cleared.
    expect(find.text('Item 2'), findsNothing);
  });

  testWidgets(
      'MultiSelectDropDown - Nested MultiSelect', (WidgetTester tester) async {
    /// Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MultiSelectDropDown<int>(
            onOptionSelected: (selectedOptions) {},
            options: const [
              DropdownItem(name: 'Item 1', code: '1', type: 'Type A'),
              DropdownItem(name: 'Item 2', code: '2', type: 'Type A'),
              DropdownItem(name: 'Item 3', code: '3', type: 'Type A'),
              DropdownItem(name: 'Item 4', code: '4', type: 'Type B'),
              DropdownItem(name: 'Item 5', code: '5', type: 'Type B'),
            ],
            selectionType: SelectionType.nestedMultiSelect,
          ),
        ),
      ),
    );

    /// Tap suffix icon to open the dropdown.
    await tester.tap(find.byIcon(Icons.arrow_drop_down));
    await tester.pump();

    /// Get the offset of the center of the widget.
    final Offset widgetCenter = tester.getCenter(find.text('Item 1'));

    /// Tap at the widget's center using tester.tapAt.
    await tester.tapAt(widgetCenter);


    /// Get the offset of the center of the widget.
    final Offset widgetCenter1 = tester.getCenter(find.text('Item 4'));

    /// Tap at the widget's center using tester.tapAt.
    await tester.tapAt(widgetCenter1);
    await tester.pumpAndSettle();

    /// Close the dropdown by tapping outside.
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle();

    /// Verify that the selected items are displayed.
    expect(find.text('2 Selected'), findsOneWidget);
    expect(find.text('Type A: Item 1'), findsOneWidget);
    expect(find.text('Type B: Item 4'), findsOneWidget);

  });

  /// TO DO

  // testWidgets('MultiSelectDropDown - Controller Interactions', (
  //     WidgetTester tester) async {
  //   final controller = MultiSelectController<int>();
  //
  //   // Build our widget and trigger a frame.
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: MultiSelectDropDown<int>(
  //           onOptionSelected: (selectedOptions) {},
  //           options: const [
  //             DropdownItem(name: 'Item 1', code: '1'),
  //             DropdownItem(name: 'Item 2', code: '2'),
  //             DropdownItem(name: 'Item 3', code: '3'),
  //           ],
  //           controller: controller,
  //         ),
  //       ),
  //     ),
  //   );
  //
  //   // Verify that the dropdown is not initially visible.
  //   expect(find.byType(MultiSelectDropDown<int>), findsOneWidget);
  //   expect(find.byType(ListView), findsNothing);
  //
  //   // Show dropdown using the controller.
  //   controller.showDropdown();
  //   await tester.pumpAndSettle();
  //   await Future.delayed(Duration(milliseconds: 2));
  //
  //   // Verify that the dropdown is visible.
  //   expect(find.byType(ListView), findsOneWidget);
  //
  //   // // Hide dropdown using the controller.
  //   // controller.hideDropdown();
  //   // await tester.pumpAndSettle();
  //
  //   // // Verify that the dropdown is hidden.
  //   // expect(find.byType(ListView), findsNothing);
  // });

}
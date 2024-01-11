import 'package:digit_components/models/TreeModel.dart';
import 'package:digit_components/widgets/atoms/digit_tree_select_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TreeSelectDropDown Tests', () {

    testWidgets('Renders TreeSelectDropDown correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TreeSelectDropDown<int>(
              options: [], // Add some test options
              onOptionSelected: (selectedOptions) {},
            ),
          ),
        ),
      );

      /// Verify if the widget renders correctly
      expect(find.byType(TreeSelectDropDown<int>), findsOneWidget);
    });

    testWidgets('Selecting an option updates the selected options', (WidgetTester tester) async {
      List<TreeNode> options = [
        TreeNode('1', 'Option 1', []),
        TreeNode('2', 'Option 2', []),
        TreeNode('3', 'Option 3', []),
      ];

      /// Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TreeSelectDropDown<int>(
              options: options,
              onOptionSelected: (selectedOptions) {},
            ),
          ),
        ),
      );

      /// Tap suffix icon to open the dropdown.
      await tester.tap(find.byIcon(Icons.arrow_drop_down));
      await tester.pump();

      /// Get the offset of the center of the widget.
      final Offset widgetCenter = tester.getCenter(find.text('Option 1'));

      /// Tap at the widget's center using tester.tapAt.
      await tester.tapAt(widgetCenter);
      await tester.pumpAndSettle();

      /// Close the dropdown by tapping outside.
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();
      /// Verify that the selected item is displayed.

      expect(find.text('Option 1'), findsWidgets);
    });

    testWidgets('Clearing selected options works as expected', (WidgetTester tester) async {
      List<TreeNode> options = [
        TreeNode('1', 'Option 1', []),
        TreeNode('2', 'Option 2', []),
        TreeNode('3', 'Option 3', []),
      ];

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TreeSelectDropDown<int>(
              options: options,
              onOptionSelected: (selectedOptions) {},
            ),
          ),
        ),
      );

      /// Tap suffix icon to open the dropdown.
      await tester.tap(find.byIcon(Icons.arrow_drop_down));
      await tester.pump();

      /// Get the offset of the center of the widget.
      final Offset widgetCenter = tester.getCenter(find.text('Option 1'));

      /// Tap at the widget's center using tester.tapAt.
      await tester.tapAt(widgetCenter);
      await tester.pumpAndSettle();

      /// Close the dropdown by tapping outside.
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      /// Verify that the selected item is displayed.
      expect(find.text('1 Selected'), findsOneWidget);
      expect(find.text('Option 1'), findsOneWidget);

      /// Clear the selection.
      await tester.tap(find.text('Clear All'));
      await tester.pump();

      /// Verify that the selection is cleared.
      expect(find.text('Option 1'), findsNothing);
    });

    testWidgets('Selecting multiple options works as expected', (WidgetTester tester) async {
      List<TreeNode> options = [
        TreeNode('1', 'Option 1', []),
        TreeNode('2', 'Option 2', []),
        TreeNode('3', 'Option 3', []),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TreeSelectDropDown<int>(
              options: options,
              onOptionSelected: (selectedOptions) {},
            ),
          ),
        ),
      );

      /// Tap suffix icon to open the dropdown.
      await tester.tap(find.byIcon(Icons.arrow_drop_down));
      await tester.pump();

      /// Get the offset of the center of the widget.
      final Offset widgetCenter = tester.getCenter(find.text('Option 1'));

      /// Tap at the widget's center using tester.tapAt.
      await tester.tapAt(widgetCenter);


      /// Get the offset of the center of the widget.
      final Offset widgetCenter1 = tester.getCenter(find.text('Option 3'));

      /// Tap at the widget's center using tester.tapAt.
      await tester.tapAt(widgetCenter1);
      await tester.pumpAndSettle();

      /// Close the dropdown by tapping outside.
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      /// Verify that the selected items are displayed.
      expect(find.text('2 Selected'), findsOneWidget);
    });


  });
}

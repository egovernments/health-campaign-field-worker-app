import 'package:digit_components/digit_components.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/models/data_model.dart';

import '../../test_variables.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
final boundaryNames = getBoundaryName();

Future<void> testBoundarySelection(WidgetTester widgetTester) async {
  await widgetTester.pumpAndSettle(
    const Duration(seconds: 5),
  );

  for (String key in boundaryNames.keys) {
    final boundaryCondition = key;
    final finder = find.widgetWithText(
      DigitReactiveSearchDropdown<BoundaryModel>,
      "$boundaryCondition*",
    );

    if (finder.evaluate().isEmpty) {
      continue;
    }

    //tap on the dropdown
    await widgetTester.tap(finder);
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));

    //tap on a boundary
    final boundaryFinder = find.text(boundaryNames[key]!).last;
    if (boundaryFinder.evaluate().isEmpty) {
      continue;
    }
    await widgetTester.tap(boundaryFinder);
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));
  }

  //submit
  await widgetTester.tap(widgetSelector['submit']!);
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  final downloadButton = find.text('Download');
  if (downloadButton.evaluate().isNotEmpty) {
    await widgetTester.tap(downloadButton);
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));

    final insufficientStorageMessage = find.text('Insufficient Storage');
    if (insufficientStorageMessage.evaluate().isNotEmpty) {
      await widgetTester.tap(find.text('Ok'));
      await widgetTester.pumpAndSettle();

      await widgetTester.tap(widgetSelector['submit']!);
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));

      await widgetTester.tap(find.text('Proceed without downloading'));
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    }
  }
}

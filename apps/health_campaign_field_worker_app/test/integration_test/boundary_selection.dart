import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/models/data_model.dart';
import 'package:health_campaign_field_worker_app/models/tenant_boundary/tenant_boundary_model.dart';

import 'test_variables.dart'; // Import test variables and widgets

// Get test data and widgets
final testVariables = getTestData();
final widgetSelector = getWidgets();
final boundaryNames = getBoundaryName();

// Function to test boundary selection
Future<void> testBoundarySelection(WidgetTester widgetTester) async {
  // Wait for the app to settle for 5 seconds
  await widgetTester.pumpAndSettle(const Duration(seconds: 5));

  // Loop through boundary names
  for (String key in boundaryNames.keys) {
    final boundaryCondition = key;
    // Find the dropdown with the given boundary condition
    final finder = find.widgetWithText(
      DigitDropdown<BoundaryModel>,
      "$boundaryCondition*",
    );

    // If no dropdown found, continue to next iteration
    if (finder.evaluate().isEmpty) {
      continue;
    }

    // Tap on the dropdown
    await widgetTester.tap(finder);
    // Wait for dropdown to settle
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));

    // Find the boundary text and tap on it
    final boundaryFinder = find.text(boundaryNames[key]!).last;
    // If no boundary text found, continue to next iteration
    if (boundaryFinder.evaluate().isEmpty) {
      continue;
    }
    await widgetTester.tap(boundaryFinder);
    // Wait for boundary selection to settle
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 50));
  }

  // Submit the form
  await widgetTester.tap(widgetSelector['submit']!);
  // Wait for submission to settle
  await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  // Find and tap on the 'Download' button if present
  final downloadButton = find.text('Download');
  final proceedWithoutDownload = find.text('Proceed without downloading');

  if (downloadButton.evaluate().isNotEmpty) {
    await widgetTester.tap(downloadButton);
    // Wait for download to settle
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));

    // If 'Insufficient Storage' message appears, handle it
    final insufficientStorageMessage = find.text('Insufficient Storage');
    if (insufficientStorageMessage.evaluate().isNotEmpty) {
      // Tap on 'Ok' button to dismiss the message
      await widgetTester.tap(find.text('Ok'));
      await widgetTester.pumpAndSettle();

      // Resubmit the form
      await widgetTester.tap(widgetSelector['submit']!);
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));

      // Proceed without downloading
      await widgetTester.tap(proceedWithoutDownload);
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    }
  } else {
    // If no 'Download' button, proceed without downloading
    if (proceedWithoutDownload.evaluate().isNotEmpty) {
      await widgetTester.tap(proceedWithoutDownload);
    }
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
  }
}

// Shared test utilities
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;
import 'package:health_campaign_field_worker_app/pages/home.dart';

Future<void> languageSelectionPageHelper(WidgetTester tester) async {
  // Select language option
  await tester.tap(find.text('ENGLISH'));
  await tester.pumpAndSettle(const Duration(seconds: 3));

  // Verify and tap continue button
  await tester.tap(find.text('Continue'));
  await tester.pumpAndSettle(const Duration(seconds: 2));
}

Future<void> loginPageHelper(WidgetTester tester, String userName, String password, int delay) async {
  await tester.enterText(find.byKey(const Key('username_field')), userName);
  await tester.enterText(find.byKey(const Key('password_field')), password);

  final privacyCheckboxFinder = find.descendant(
    of: find.byKey(const Key('privacy_component')),
    // The first child (GestureDetector) inside the PrivacyComponent is the checkbox area.
    matching: find.byType(GestureDetector),
  );
  if (privacyCheckboxFinder.evaluate().isNotEmpty) {
    await tester.tap(privacyCheckboxFinder.first);
    // Short pump to update UI.
    await tester.pump();
  } else {
    // Fallback: tap the whole privacy component if needed.
    await tester.tap(find.byKey(const Key('privacy_component')));
    await tester.pump();
  }

  // Submit login
  await tester.tap(find.byKey(const Key('login_button')));
  await tester.pumpAndSettle(Duration(seconds: delay));
}

Future<void> languageToHomepageHelper(WidgetTester tester) async {
  // Use shared navigation helper
  await languageSelectionPageHelper(tester);

  // Check for errors during test
  var exception = tester.takeException();
  if (exception != null) {
    debugPrint('Unhandled exception: $exception');
  }

  // Enter credentials(Valid credentials flow)
  await loginPageHelper(tester,'USR-260848','eGov@123',5);

  // Wait for asynchronous operations to settle.
  await tester.pump(const Duration(seconds: 3));

  await tester.tap(find.byKey(const Key('projects')).first);

  // Wait for asynchronous operations to settle.
  await tester.pump(const Duration(seconds: 5));

  // Additionally, verify a part of the loaded UI exists.
  // For instance, check for the presence of a Form widget.
  expect(find.byKey(const Key('boundary_form')), findsWidgets);

  // Wait for asynchronous operations to settle.
  await tester.pump(const Duration(seconds: 1));

  // Find all DigitDropdown widgets that display boundaries.
  final dropdownFinder = find.byKey(const Key('boundary_selection_page_dropdown'));
  expect(dropdownFinder, findsWidgets);

  // For each dropdown, simulate a tap to open the dropdown menu,
  // then select the first option (dummyBoundary's code is "B1").
  final dropdownElements = dropdownFinder.evaluate().toList();
  for (final element in dropdownElements) {
    // Tap on the dropdown widget.
    await tester.tap(find.byWidget(element.widget));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Locate the dropdown menu option; use find.text with the boundary code.
    final optionFinder = find.byType(Text);
    expect(optionFinder, findsWidgets);
    await tester.tap(optionFinder.first);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  // Find the submit button; here we assume it's a DigitButton with "Submit" in its label.
  final submitButtonFinder = find.byKey(const Key('boundary_selection_submit_button')); //find.text('boundary_selection_submit_button');
  expect(submitButtonFinder, findsOneWidget);

  // Tap the submit button.
  await tester.tap(submitButtonFinder);
  await tester.pumpAndSettle(const Duration(seconds: 5));

  await tester.tap(find.text('Proceed Without Downloading'));

  await tester.pumpAndSettle(const Duration(seconds: 1));

  expect(find.byType(HomePage), findsOneWidget);
}
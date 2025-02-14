// Shared test utilities
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;

Future<void> languageSelectionHelper(WidgetTester tester) async {
  // Select language option
  await tester.tap(find.text('ENGLISH'));
  await tester.pumpAndSettle(const Duration(seconds: 5));

  // Verify and tap continue button
  await tester.tap(find.text('Continue'));
  await tester.pumpAndSettle(const Duration(seconds: 2));
}

Future<void> loginPageHelper(WidgetTester tester, String userName, String password, int delay) async {
  await tester.enterText(find.byKey(const Key('username_field')), userName);
  await tester.enterText(find.byKey(const Key('password_field')), password);
  await tester.pumpAndSettle(const Duration(seconds: 3));

  // Submit login
  await tester.tap(find.byKey(const Key('login_button')));
  await tester.pumpAndSettle(Duration(seconds: delay));
}
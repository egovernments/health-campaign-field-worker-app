import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/pages/login.dart';
import 'package:health_campaign_field_worker_app/pages/project_selection.dart';
import 'package:integration_test/integration_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final _username = find.byKey(const Key('username'));
  final _password = find.byKey(const Key('password'));

  group('Login Tests', () {
    Future<void> init(WidgetTester tester) async {
      app.main(); //start the app
    }

    testWidgets('Login Test without password', (WidgetTester tester) async {
      await init(tester);

      await tester.pumpAndSettle(
        const Duration(seconds: 2),
      ); //wait for the app to load languages

      await tester.tap(find.widgetWithText(DigitElevatedButton, 'Continue'));
      await tester.pumpAndSettle(
        const Duration(seconds: 2),
      ); //wait for the app to load the login page

      expect(
        find.byType(LoginPage),
        findsOneWidget,
      ); //check if the login page is loaded

      await tester.enterText(_username, 'testusername');
      await tester.enterText(_password, '');

      await tester.tap(find.byKey(const Key('login')));
      await tester.pumpAndSettle(const Duration(seconds: 5));

      //find the text widget that contains the error message
      expect(find.text('Password is Required'), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.byType(ProjectSelectionPage),
          findsNothing); //check if the home page is loaded
    });

    testWidgets('Login Test without username', (WidgetTester tester) async {
      await init(tester);

      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to load languages

      await tester.tap(find.widgetWithText(DigitElevatedButton, 'Continue'));
      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to load the login page

      expect(find.byType(LoginPage),
          findsOneWidget); //check if the login page is loaded

      await tester.enterText(_username, '');
      await tester.enterText(_password, 'testpassword');

      await tester.tap(find.byKey(const Key('login')));
      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.text('User ID is Required'), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.byType(ProjectSelectionPage),
          findsNothing); //check if the home page is loaded
    });
    testWidgets('Login Test wrong-user', (WidgetTester tester) async {
      await init(tester);

      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to load languages

      await tester.tap(find.widgetWithText(DigitElevatedButton, 'Continue'));

      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to load the login page

      expect(find.byType(LoginPage),
          findsOneWidget); //check if the login page is loaded

      await tester.enterText(
          _username, 'wrong-user'); //enter the username to test
      await tester.enterText(
          _password, 'eGov@1234'); //enter the password to test

      await tester
          .tap(find.byKey(const Key('login'))); //tap on the login button
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byType(ProjectSelectionPage),
          findsNothing); //check if the home page is loaded
    });
    testWidgets('Login Test wrong-password', (WidgetTester tester) async {
      await init(tester);

      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to load languages

      await tester.tap(find.widgetWithText(DigitElevatedButton, 'Continue'));

      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to load the login page

      expect(find.byType(LoginPage),
          findsOneWidget); //check if the login page is loaded

      await tester.enterText(_username, 'D-5550'); //enter the username to test
      await tester.enterText(
          _password, 'wrong-password'); //enter the password to test

      await tester
          .tap(find.byKey(const Key('login'))); //tap on the login button
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byType(ProjectSelectionPage),
          findsNothing); //check if the home page is loaded
    });
    testWidgets('Login Test SQL Injection', (WidgetTester tester) async {
      await init(tester);

      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to load languages

      await tester.tap(find.widgetWithText(DigitElevatedButton, 'Continue'));

      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to load the login page

      expect(find.byType(LoginPage),
          findsOneWidget); //check if the login page is loaded

      // Enter SQL Injection payload into the username and password fields
      await tester.enterText(
          _username, "' OR '1'='1'; --"); //enter the username to test
      await tester.enterText(
          _password, "' OR '1'='1'; --"); //enter the password to test

      await tester
          .tap(find.byKey(const Key('login'))); //tap on the login button
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Check if the login was unsuccessful
      expect(find.byType(ProjectSelectionPage),
          findsNothing); //check if the home page is loaded
    });
    testWidgets('Login Test normal', (WidgetTester tester) async {
      await init(tester);

      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to load languages

      await tester.tap(find.widgetWithText(DigitElevatedButton, 'Continue'));

      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to load the login page

      expect(find.byType(LoginPage),
          findsOneWidget); //check if the login page is loaded

      await tester.enterText(_username, 'ATTD17'); //enter the username to test
      await tester.enterText(
          _password, 'eGov@1234'); //enter the password to test

      await tester
          .tap(find.byKey(const Key('login'))); //tap on the login button
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(
        find.byType(ProjectSelectionPage),
        findsOneWidget,
      ); //check if the home page is loaded
    });
  });
}

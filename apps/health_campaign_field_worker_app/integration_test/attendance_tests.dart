import 'package:attendance_management/pages/mark_attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Manage Attendance Page', () {
    testWidgets('Fetch Registers', (widgetTester) async {
      app.main();
      expect(find.text('Open Register'), findsOneWidget);
    });

    testWidgets('Open register', (tester) async {
      app.main();
      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to load registers
      await tester.tap(find.byKey(const Key('registerCard')));
      await tester.pumpAndSettle(
          const Duration(seconds: 2)); //wait for the app to go to the next page
      expect(find.byType(MarkAttendancePage),
          findsOneWidget); //check if we go to the next page
    });

  });


  group('Mark attendance logic', (){
   testWidgets('Present/Absent status should change on tapping on the button', (widgetTester) {
      app.main();

      widgetTester.pumpAndSettle(const Duration(seconds: 2));
      widgetTester.tap(find.byKey(const Key('')));
      expect(find.text('Present'), findsOneWidget);
      expect(find.text('Absent'), findsOneWidget);
      expect(find.text('Present'), findsOneWidget);
      expect(find.text('Absent'), findsOneWidget);
   });
  })
}

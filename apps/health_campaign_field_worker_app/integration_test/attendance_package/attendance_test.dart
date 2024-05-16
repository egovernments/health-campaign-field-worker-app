import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;
import 'package:integration_test/integration_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';
import '../logout.dart';
import '../test_variables.dart';
import '../boundary_selection.dart';
import 'date_session_selection.dart';
import 'login.dart';
import 'manage_attendance.dart';
import 'mark_attendance.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final widgetSelector = getWidgets();

  testWidgets('Get to the manage Attendance Page', (widgetTester) async {
    disableOverflowError();
    app.main();
    await widgetTester.pumpAndSettle(
      const Duration(seconds: 5),
    ); //wait for the app to load languages

    await login(widgetTester);
    await testBoundarySelection(widgetTester);
    await manageAttendance(widgetTester);
    await selectDate(widgetTester);
    await markAttendance(widgetTester);
    await logout(widgetTester);
  });
}

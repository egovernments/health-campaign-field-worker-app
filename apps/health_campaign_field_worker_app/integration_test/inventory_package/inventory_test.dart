import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';
import 'package:integration_test/integration_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;
import '../test_variables.dart';
import 'pages/boundary_selection.dart';
import 'pages/login.dart';
import 'pages/manage_stock.dart';
import 'pages/stock_reconciliation.dart';
import 'pages/view_reports.dart';

final testVariables = getTestData();
final widgetSelector = getWidgets();
final boundaryNames = getBoundaryName();

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Inventory Package Tests', (widgetTester) async {
    disableOverflowError();
    app.main();

    await testLoginPage(widgetTester);
    await testBoundarySelection(widgetTester);
    await testManageStockPage(widgetTester);
    await testStockReconciliationPage(widgetTester);
    await testViewReportsPage(widgetTester);
  });
}

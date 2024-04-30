import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_project_cell.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/models/data_model.dart';
import 'package:health_campaign_field_worker_app/pages/boundary_selection.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';
import 'package:integration_test/integration_test.dart';
import 'package:health_campaign_field_worker_app/main.dart' as app;
import 'test_variables.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final testVariables = getTestData();
  final widgetSelector = getWidgets();

  final boundaryNames = getBoundaryName();

  testWidgets('Inventory Package Tests', (widgetTester) async {
    disableOverflowError();
    app.main();

    //let the app initialize
    await widgetTester.pumpAndSettle(
      const Duration(seconds: 5),
    );

    await widgetTester
        .tap(widgetSelector['continue']!); //tap on the continue button

    await widgetTester.pumpAndSettle(const Duration(
        milliseconds: 1000)); //wait for the app to load the login page

    await widgetTester.enterText(
      widgetSelector['username']!,
      testVariables['username'],
    ); //enter the username to test

    await widgetTester.enterText(
      widgetSelector['password']!,
      testVariables['password'],
    ); //enter the password to test

    await widgetTester.tap(widgetSelector['login']!); //tap on the login button
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));

    //choose a project
    await widgetTester.tap(find.byType(DigitProjectCell).first);
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));

    expect(
      find.byType(BoundarySelectionPage),
      findsOneWidget,
    ); //check if the boundary page is loaded
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));

    for (String key in boundaryNames.keys) {
      final boundaryCondition = key;
      try {
        final finder = find.widgetWithText(
          DigitReactiveSearchDropdown<BoundaryModel>,
          boundaryCondition,
        );
        //tap on the dropdown
        await widgetTester.tap(finder);
        await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));

        //tap on a boundary
        await widgetTester.tap(find.text(boundaryNames[key]!));
      } catch (e) {
        continue;
      }
    }

    //submit
    await widgetTester.tap(widgetSelector['submit']!);
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));

    //go to the manage stock page
    await widgetTester.tap(widgetSelector['manageStock']!);
    await widgetTester.pumpAndSettle();
  });
}

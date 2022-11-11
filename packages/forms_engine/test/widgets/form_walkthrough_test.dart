import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:forms_engine/forms_engine.dart';
import '../fake_schema.dart';
import '../router/router.dart';
import '../router_test_utils.dart';

void main() {
  late AppRouter router;
  late String pageName;
  setUp(() {
    router = AppRouter();
    pageName =
        SchemaObject.fromJson(json.decode(fakeSchema)).pages.entries.first.key;
  });

  group('Forms Walkthrough', () {
    testWidgets('Initial route should be', (WidgetTester tester) async {
      await pumpRouterApp(tester, router);
      router.push(
        FormsRoute(
          pageName: pageName,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('WALKTHROUGH_BTN'), findsOneWidget);
      await tester.tap(find.text('WALKTHROUGH_BTN'));
      await tester.pump();
      expect(find.text('Administration Area Detail'), findsOneWidget);
    });
  });
}

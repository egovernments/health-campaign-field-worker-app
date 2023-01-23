import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/pages/household_overview.dart';

import 'package:health_campaign_field_worker_app/utils/i18_key_constants.dart'
    as i18;
import 'package:health_campaign_field_worker_app/widgets/member_card/member_card.dart';
import 'package:mocktail/mocktail.dart';

class MockStackRouter extends Mock implements StackRouter {
  @override
  bool canPop({
    bool ignoreChildRoutes = false,
    bool ignoreParentRoutes = false,
    bool ignorePagelessRoutes = false,
  }) {
    return true;
  }
}

void main() {
  group('Household OverView Page', () {
    final mockStackRouter = MockStackRouter();
    Future<void> buildTester(WidgetTester tester) async {
      await tester.pumpWidget(
        Center(
          child: MaterialApp(
            home: StackRouterScope(
              controller: mockStackRouter,
              stateHash: 1,
              child: const HouseholdOverViewPage(),
            ),
          ),
        ),
      );
    }

    testWidgets(
      'Ensure that Delivery Intervention button is initialized and rendered correctly',
      (widgetTester) async {
        await buildTester(widgetTester);
        await widgetTester.pumpAndSettle();

        expect(find.byType(DigitElevatedButton), findsOneWidget);
        expect(
          find.widgetWithText(
            DigitElevatedButton,
            i18.householdOverView.householdOverViewActionText,
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Ensure that correct number of DigitCards are rendered on screen',
      (widgetTester) async {
        await buildTester(widgetTester);
        await widgetTester.pumpAndSettle();

        expect(find.byType(DigitCard), findsNWidgets(2));
      },
    );

    testWidgets(
      'Ensure that correct number of DigitCards are rendered on screen',
      (widgetTester) async {
        await buildTester(widgetTester);
        await widgetTester.pumpAndSettle();

        expect(find.byType(MemberCard), findsNWidgets(2));
      },
    );
  });
}

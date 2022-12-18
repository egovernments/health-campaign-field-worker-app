import 'package:health_campaign_field_worker_app/widgets/benificiary/benificiary_card.dart';

import '../widget_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Benificiary Card Test',
    () {
      testWidgets(
        'Widget is created without errors',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const WidgetApp(
              child: BenificiaryCard(
                description: '219 / Pemba (200mts)',
                subtitle: '4 Members',
                status: 'Delivered',
                title: 'Jose Antonio',
              ),
            ),
          );
          expect(
            find.widgetWithText(BenificiaryCard, '219 / Pemba (200mts)'),
            findsOneWidget,
          );
        },
      );
    },
  );
}


import 'package:registration_delivery/widgets/beneficiary/beneficiary_card.dart';

import '../widget_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Beneficiary Card Test',
    () {
      testWidgets(
        'Widget is created without errors',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const WidgetApp(
              child: BeneficiaryCard(
                description: '219 / Pemba (200mts)',
                subtitle: '4 Members',
                status: 'Delivered',
                title: 'Jose Antonio',
              ),
            ),
          );
          expect(
            find.widgetWithText(BeneficiaryCard, '219 / Pemba (200mts)'),
            findsOneWidget,
          );
        },
      );
    },
  );
}

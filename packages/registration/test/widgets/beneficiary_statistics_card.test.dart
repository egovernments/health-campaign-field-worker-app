import 'package:flutter_test/flutter_test.dart';
import 'package:registration/models/entities/beneficiary_statistics/beneficiary_statistics_model.dart';
import 'package:registration/widgets/beneficiary/beneficiary_statistics_card.dart';

import 'widget_app.dart';

void main() {
  group(
    'BeneficiaryStatisticsCard Test',
    () {
      testWidgets(
        'Widget is created without errors',
        (widgetTester) async {
          await widgetTester.pumpWidget(const WidgetApp(
            child: BeneficiaryStatisticsCard(
              beneficiaryStatistics:
                  BeneficiaryStatisticsWrapperModel(beneficiaryStatisticsList: [
                BeneficiaryStatisticsModel(
                  title: '535',
                  content: 'No. of Households Registered',
                ),
                BeneficiaryStatisticsModel(
                  title: '756',
                  content: 'No. of Bedets Delivered',
                ),
              ]),
            ),
          ));
          expect(
            find.widgetWithText(BeneficiaryStatisticsCard, '535'),
            findsOneWidget,
          );
        },
      );
    },
  );
}

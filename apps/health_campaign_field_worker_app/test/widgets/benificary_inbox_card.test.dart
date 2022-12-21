import 'package:health_campaign_field_worker_app/models/beneficiary_statistics/beneficiary_statistics_model.dart';
import 'package:health_campaign_field_worker_app/widgets/beneficiary/beneficiary_%20statistics_card.dart';
import '../widget_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'BenificiaryInboxCard Test',
    () {
      testWidgets(
        'Widget is created without errors',
        (widgetTester) async {
          await widgetTester.pumpWidget(const WidgetApp(
            child: BeneficiaryStatisticsCard(
              beneficiaryStatistics:
                  BeneficiaryStatisticsWrapperModel(beneficiaryStatisticsList: [
                BeneficiaryStatisticsModel(title: '', content: ''),
                BeneficiaryStatisticsModel(title: '', content: ''),
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

import 'package:health_campaign_field_worker_app/widgets/benificiary/benificiary_inbox_card.dart';
import '../widget_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'BenificiaryInboxCard Test',
    () {
      testWidgets(
        'Widget is created without errors',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const WidgetApp(
              child: BenificiaryInboxCard(
                firstInbox: '535',
                firstInboxContent: 'No. of Households Registered',
                secondInbox: '756',
                secondInboxContent: 'No. of Bedets Delivered',
              ),
            ),
          );
          expect(
            find.widgetWithText(BenificiaryInboxCard, '535'),
            findsOneWidget,
          );
        },
      );
    },
  );
}

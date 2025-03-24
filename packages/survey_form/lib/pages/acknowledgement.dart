import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import '../utils/i18_key_constants.dart' as i18;
import '../widgets/localized.dart';

@RoutePage()
class SurveyFormAcknowledgementPage extends LocalizedStatefulWidget {
  final bool isDataRecordSuccess;
  final String? label;
  final String? description;
  final Map<String, dynamic>? descriptionTableData;
  const SurveyFormAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.isDataRecordSuccess = false,
    this.label,
    this.description,
    this.descriptionTableData,
  });

  @override
  State<SurveyFormAcknowledgementPage> createState() =>
      AcknowledgementPageState();
}

class AcknowledgementPageState
    extends LocalizedState<SurveyFormAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PanelCard(
        type: PanelType.success,
        title: localizations.translate(
          i18.acknowledgementSuccess.acknowledgementLabelText,
        ),
        description: localizations.translate(
          i18.acknowledgementSuccess.acknowledgementDescriptionText,
        ),
        actions: [
          DigitButton(
            label: localizations
                .translate(i18.acknowledgementSuccess.actionLabelText),
            onPressed: () => context.router.popUntilRoot(),
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
          )
        ],
      ),
      bottomNavigationBar: Offstage(
        offstage: !widget.isDataRecordSuccess,
        // Show the bottom navigation bar if `isDataRecordSuccess` is true
        child: SizedBox(
          height: 150,
          child: DigitCard(
              cardType: CardType.primary,
              margin: const EdgeInsets.only(top: spacer2),
              children: [
                Column(
                  children: [
                    DigitButton(
                      label: localizations
                          .translate(i18.acknowledgementSuccess.goToHome),
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large,
                      onPressed: () {
                        context.router.maybePop();
                      },
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

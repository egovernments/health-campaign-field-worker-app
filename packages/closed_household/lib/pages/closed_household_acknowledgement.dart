import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';

@RoutePage()
class ClosedHouseholdAcknowledgementPage extends LocalizedStatefulWidget {
  const ClosedHouseholdAcknowledgementPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ClosedHouseholdAcknowledgementPage> createState() =>
      _ClosedHouseholdAcknowledgementPageState();
}

class _ClosedHouseholdAcknowledgementPageState
    extends LocalizedState<ClosedHouseholdAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
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
                onPressed: () {
                  final parent = context.router.parent() as StackRouter;
                  // Pop twice to navigate back to the previous screen
                  parent.popUntilRoot();
                },
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
              )
            ]),
      ),
    );
  }
}

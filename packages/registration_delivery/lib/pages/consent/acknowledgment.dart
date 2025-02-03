import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';

@RoutePage()
class ConsentHouseholdAcknowledgementPage extends LocalizedStatefulWidget {
  final bool? enableViewHousehold;

  const ConsentHouseholdAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.enableViewHousehold,
  });

  @override
  State<ConsentHouseholdAcknowledgementPage> createState() =>
      _ConsentHouseholdAcknowledgementPageState();
}

class _ConsentHouseholdAcknowledgementPageState
    extends LocalizedState<ConsentHouseholdAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PanelCard(
        type: PanelType.success,
        title: localizations
            .translate(i18.acknowledgementSuccess.acknowledgementLabelText),
        actions: [
          // DigitButton(
          //     label: localizations.translate(
          //       i18.householdDetails.viewHouseHoldDetailsAction,
          //     ),
          //     onPressed: () {
          //       final wrapper = context
          //           .read<HouseholdOverviewBloc>()
          //           .state
          //           .householdMemberWrapper;
          //
          //       context.router.popAndPush(
          //         BeneficiaryWrapperRoute(wrapper: wrapper),
          //       );
          //     },
          //     type: DigitButtonType.primary,
          //     size: DigitButtonSize.large),
          DigitButton(
              label: localizations
                  .translate(i18.acknowledgementSuccess.actionLabelText),
              onPressed: () {
                final parent = context.router.parent() as StackRouter;
                // Pop twice to navigate back to the previous screen
                parent
                  ..maybePop()
                  ..maybePop();
              },
              type: DigitButtonType.secondary,
              size: DigitButtonSize.large),
        ],
        description: localizations.translate(
          i18.acknowledgementSuccess.acknowledgementDescriptionText,
        ),
      ),
    );
  }
}

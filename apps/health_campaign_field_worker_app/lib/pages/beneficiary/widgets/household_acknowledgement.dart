import 'dart:async';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../../blocs/search_households/search_households.dart';
import '../../../router/app_router.dart';
import '../../../widgets/localized.dart';
import '../../../utils/i18_key_constants.dart' as i18;

class HouseholdAcknowledgementPage extends LocalizedStatefulWidget {
  final bool? enableViewHousehold;
  final HouseholdMemberWrapper wrapper;
  const HouseholdAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.enableViewHousehold,
    required this.wrapper,
  });

  @override
  State<HouseholdAcknowledgementPage> createState() =>
      _HouseholdAcknowledgementPageState();
}

class _HouseholdAcknowledgementPageState
    extends LocalizedState<HouseholdAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DigitAcknowledgement.success(
        action: () {
          final parent = context.router.parent() as StackRouter;
          // Pop twice to navigate back to the previous screen
          parent
            ..pop()
            ..pop();
        },
        secondaryAction: () {
          context.router.popAndPush(
            BeneficiaryWrapperRoute(wrapper: widget.wrapper),
          );
        },
        enableViewHousehold: widget.enableViewHousehold ?? false,
        secondaryLabel: localizations.translate(
          i18.householdDetails.viewHouseHoldDetailsAction,
        ),
        actionLabel:
            localizations.translate(i18.acknowledgementSuccess.actionLabelText),
        description: localizations.translate(
          i18.acknowledgementSuccess.acknowledgementDescriptionText,
        ),
        label: localizations
            .translate(i18.acknowledgementSuccess.acknowledgementLabelText),
      ),
    );
  }
}

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/localized.dart';

class AcknowledgementPage extends LocalizedStatefulWidget {
  final bool? enableViewHousehold;

  const AcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.enableViewHousehold,
  });

  @override
  State<AcknowledgementPage> createState() => _AcknowledgementPageState();
}

class _AcknowledgementPageState extends LocalizedState<AcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DigitAcknowledgement.success(
        action: () {
          context.router.pop();
        },
        secondaryAction: () {
          context.router.popUntilRouteWithName(
            HouseholdOverviewRoute.name,
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

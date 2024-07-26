import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
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
        body: DigitAcknowledgement.success(
              action: () {
                final parent = context.router.parent() as StackRouter;
                // Pop twice to navigate back to the previous screen
                parent.popUntilRoot();
              },
              enableViewHousehold: false,
              actionLabel: localizations
                  .translate(i18.acknowledgementSuccess.actionLabelText),
              description: localizations.translate(
                i18.acknowledgementSuccess.acknowledgementDescriptionText,
              ),
              label: localizations.translate(
                i18.acknowledgementSuccess.acknowledgementLabelText,
              ),
            ),
      ),
    );
  }
}

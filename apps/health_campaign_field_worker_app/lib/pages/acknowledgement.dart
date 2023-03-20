import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/localized.dart';

class AcknowledgementPage extends LocalizedStatefulWidget {
  const AcknowledgementPage({
    super.key,
    super.appLocalizations,
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
          final parent = context.router.parent();
          if (parent is StackRouter) {
            var routeCollection = context.router.stack;
            bool isBeneficiaryPage = false;
            for (var element in routeCollection) {
              if (element.routeData.path == "beneficiary-registration") {
                isBeneficiaryPage = true;
              }
            }

            if (isBeneficiaryPage) {
              parent.navigate(SearchBeneficiaryRoute());

              return;
            }

            parent.navigate(HomeRoute());
          }
        },
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
